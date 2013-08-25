//
//  HCAssertThatAfter.m
//  OCHamcrest
//
//  Created by Sergio Padrino on 8/25/13.
//  Copyright (c) 2013 hamcrest.org. All rights reserved.
//

#import "HCAssertThatAfter.h"

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

void HC_assertThatAfterWithLocation(id testCase, NSTimeInterval maxTime, HCAssertThatAfterActualBlock actualBlock,
                                    id<HCMatcher> matcher, const char *fileName, int lineNumber)
{
    BOOL matches = NO;
    id actual = nil;
    NSTimeInterval timeOut = maxTime;
    NSDate *expiryDate = [NSDate dateWithTimeIntervalSinceNow:timeOut];
    while(1)
    {
        actual = actualBlock();
        matches = [matcher matches:actual];
        if(matches || ([(NSDate *)[NSDate date] compare:expiryDate] == NSOrderedDescending)) {
            break;
        }
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
        OSMemoryBarrier();
    }
    
    if (!matches)
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
}
