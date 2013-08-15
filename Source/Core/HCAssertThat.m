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
    __unsafe_unretained NSException *result = nil;
    
    // Description expects a format string, but NSInvocation does not support varargs.
    // Mask % symbols in the string so they aren't treated as placeholders.
    description = [description stringByReplacingOccurrencesOfString:@"%"
                                                         withString:@"%%"];
    id fileArg = @(fileName);
    
    NSMethodSignature *signature = [[NSException class] methodSignatureForSelector:selector];
    if (nil != signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:[NSException class]];
        [invocation setSelector:selector];
        
        BOOL expected = NO;
        [invocation setArgument:&description atIndex:2];
        [invocation setArgument:&fileArg atIndex:3];
        [invocation setArgument:&lineNumber atIndex:4];
        [invocation setArgument:&expected atIndex:5];
        
        [invocation invoke];
        [invocation getReturnValue:&result];
    }
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
- (void)recordFailureWithDescription:(NSString *) description inFile:(NSString *) filename atLine:(NSUInteger) lineNumber expected:(BOOL) expected;
- (void)unexistsMetod;
@end

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                               const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        HCStringDescription *description = [HCStringDescription stringDescription];
        [[[description appendText:@"Expected "]
          appendDescriptionOf:matcher]
         appendText:@", but "];
        [matcher describeMismatchOf:actual to:description];
        
        NSException *assertThatFailure = createAssertThatFailure(fileName, lineNumber,
                                                                 [description description]);
        if ([testCase respondsToSelector:@selector(failWithException:)]) {
            [testCase failWithException:assertThatFailure];
        } else if ([testCase respondsToSelector:@selector(recordFailureWithDescription:inFile:atLine:expected:)]) {
            NSNumber *n = [NSNumber numberWithInt:lineNumber];
            [testCase recordFailureWithDescription:[description description]
                                            inFile:[NSString stringWithUTF8String:fileName]
                                            atLine:[n unsignedIntegerValue]
                                          expected:NO];
        } else {
            [testCase unexistsMetod];
        }
    }
}
