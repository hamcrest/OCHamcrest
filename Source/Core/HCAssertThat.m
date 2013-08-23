//
//  OCHamcrest - HCAssertThat.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCAssertThat.h"

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

static NSString *makeStringDescribingMismatch(id matcher, id actual)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [[[description appendText:@"Expected "]
            appendDescriptionOf:matcher]
            appendText:@", but "];
    [matcher describeMismatchOf:actual to:description];
    return [description description];
}

// As of 2010-09-09, the iPhone simulator has a bug where you can't catch
// exceptions when they are thrown across NSInvocation boundaries. (See
// dmaclach's comment at http://openradar.appspot.com/8081169 ) So instead of
// using an NSInvocation to call failWithException:assertThatFailure without
// linking in OCUnit, we simply pretend it exists on NSObject.
@interface NSObject (HCExceptionBugHack)

- (void)failWithException:(NSException *)exception;

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected;

@end


static BOOL isXCTestCase(id testCase)
{
    return [testCase respondsToSelector:@selector(recordFailureWithDescription:inFile:atLine:expected:)];
}

static BOOL isSenTestCase(id testCase)
{
    return [testCase respondsToSelector:@selector(failWithException:)];
}

static void signalXCTestFailure(id testCase, char const *fileName, int lineNumber, NSString *description)
{
    [testCase recordFailureWithDescription:description
                                    inFile:[NSString stringWithUTF8String:fileName]
                                    atLine:(NSUInteger)lineNumber
                                  expected:YES];
}

static void signalOCUnitTestFailure(id testCase, char const *fileName, int lineNumber, NSString *description)
{
    NSException *exception = createOCUnitException(fileName, lineNumber, description);
    [testCase failWithException:exception];
}

static void signalGenericTestFailure(id testCase, const char *fileName, int lineNumber, NSString *description)
{
    NSException *exception = createGenericException(fileName, lineNumber, description);
    [testCase failWithException:exception];
}

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        NSString *description = makeStringDescribingMismatch(matcher, actual);
        if (isXCTestCase(testCase))
            signalXCTestFailure(testCase, fileName, lineNumber, description);
        else if (isSenTestCase(testCase))
            signalOCUnitTestFailure(testCase, fileName, lineNumber, description);
        else
            signalGenericTestFailure(testCase, fileName, lineNumber, description);
    }
}
