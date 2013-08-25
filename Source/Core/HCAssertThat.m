//
//  OCHamcrest - HCAssertThat.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCAssertThat.h"

#import <libkern/OSAtomic.h>

#import "HCStringDescription.h"
#import "HCMatcher.h"


static inline BOOL isLinkedToOCUnit()
{
    return NSClassFromString(@"XCTestCase") != Nil || NSClassFromString(@"SenTestCase") != Nil;
}

/**
    Create OCUnit failure
    
    With OCUnit's extension to NSException, this is effectively the same as
@code
[NSException failureInFile: [NSString stringWithUTF8String:fileName]
                    atLine: lineNumber
           withDescription: description]
@endcode
    except we use an NSInvocation so that OCUnit (SenTestingKit) does not have to be linked.
 */
static NSException *createOCUnitException(const char* fileName, int lineNumber, NSString *description)
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    SEL selector = @selector(failureInFile:atLine:withDescription:);
#pragma clang diagnostic pop

    // Description expects a format string, but NSInvocation does not support varargs.
    // Mask % symbols in the string so they aren't treated as placeholders.
    description = [description stringByReplacingOccurrencesOfString:@"%"
                                                         withString:@"%%"];

    NSMethodSignature *signature = [[NSException class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:[NSException class]];
    [invocation setSelector:selector];
    
    id fileArg = @(fileName);
    [invocation setArgument:&fileArg atIndex:2];
    [invocation setArgument:&lineNumber atIndex:3];
    [invocation setArgument:&description atIndex:4];
    
    [invocation invoke];
    __unsafe_unretained NSException *result = nil;
    [invocation getReturnValue:&result];
    return result;
}

static NSException *createGenericException(const char *fileName, int lineNumber, NSString *description)
{
    NSString *failureReason = [NSString stringWithFormat:@"%s:%d: matcher error: %@",
                               fileName, lineNumber, description];
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}

static NSException *createAssertThatFailure(const char *fileName, int lineNumber, NSString *description)
{
    if (isLinkedToOCUnit())
        return createOCUnitException(fileName, lineNumber, description);
    else
        return createGenericException(fileName, lineNumber, description);
}


#pragma mark -

// As of 2010-09-09, the iPhone simulator has a bug where you can't catch
// exceptions when they are thrown across NSInvocation boundaries. (See
// dmaclach's comment at http://openradar.appspot.com/8081169 ) So instead of
// using an NSInvocation to call failWithException:assertThatFailure without
// linking in OCUnit, we simply pretend it exists on NSObject.
@interface NSObject (HCExceptionBugHack)
- (void)failWithException:(NSException *)exception;
@end

static void failMatcher(id testCase, id actual, id<HCMatcher> matcher,
                        const char *fileName, int lineNumber)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [[[description appendText:@"Expected "]
                   appendDescriptionOf:matcher]
                   appendText:@", but "];
    [matcher describeMismatchOf:actual to:description];

    NSException *assertThatFailure = createAssertThatFailure(fileName, lineNumber,
                                                             [description description]);
    [testCase failWithException:assertThatFailure];
}

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        failMatcher(testCase, actual, matcher, fileName, lineNumber);
    }
}

void HC_willAssertThatWithLocation(id testCase, id (^actualBlock)(void), id<HCMatcher> matcher,
                                   const char *fileName, int lineNumber)
{
    BOOL matchResult = NO;
    NSTimeInterval timeout = HC_willDefaultTimeout();
    NSDate *expiryDate = [NSDate dateWithTimeIntervalSinceNow:timeout];

    id actual = actualBlock();
    while (1)
    {
        matchResult = [matcher matches:actual];
        if (matchResult || [(NSDate *)[NSDate date] compare:expiryDate] == NSOrderedDescending)
            break;
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
        OSMemoryBarrier();
        actual = actualBlock();
    }

    if (!matchResult)
    {
        failMatcher(testCase, actual, matcher, fileName, lineNumber);
    }
}



static NSTimeInterval sWillDefaultTimeout = 1.0; // seconds

NSTimeInterval HC_willDefaultTimeout()
{
    return sWillDefaultTimeout;
}

void HC_setWillDefaultTimeout(NSTimeInterval defaultTimeout)
{
    sWillDefaultTimeout = defaultTimeout;
}
