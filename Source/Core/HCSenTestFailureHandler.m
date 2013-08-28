#import "HCSenTestFailureHandler.h"

#import "HCTestFailure.h"


@interface NSObject (PretendMethodsExistOnNSObjectToAvoidLinkingSenTestingKit)

+ (NSException *)failureInFile:(NSString *)filename
                        atLine:(int)lineNumber
               withDescription:(NSString *)formatString, ...;

- (void)failWithException:(NSException *)exception;

@end


@implementation HCSenTestFailureHandler

@synthesize successor = _successor;

- (void)handleFailure:(HCTestFailure *)failure
{
    if ([self willHandleFailure:failure])
        [self executeHandlingOfFailure:failure];
    else
        [self.successor handleFailure:failure];
}

- (BOOL)willHandleFailure:(HCTestFailure *)failure
{
    return [failure.testCase respondsToSelector:@selector(failWithException:)];
}

- (void)executeHandlingOfFailure:(HCTestFailure *)failure
{
    NSException *exception = [self createExceptionForFailure:failure];
    [failure.testCase failWithException:exception];
}

- (NSException *)createExceptionForFailure:(HCTestFailure *)failure
{
    NSString *fileName = failure.fileName;
    NSUInteger lineNumber = failure.lineNumber;

    // Description expects a format string, but NSInvocation does not support varargs.
    // Mask % symbols in the string so they aren't treated as placeholders.
    NSString *description = [failure.reason stringByReplacingOccurrencesOfString:@"%"
                                                                      withString:@"%%"];

    SEL selector = @selector(failureInFile:atLine:withDescription:);
    NSMethodSignature *signature = [[NSException class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:[NSException class]];
    [invocation setSelector:selector];

    [invocation setArgument:&fileName atIndex:2];
    [invocation setArgument:&lineNumber atIndex:3];
    [invocation setArgument:&description atIndex:4];

    [invocation invoke];
    __unsafe_unretained NSException *result = nil;
    [invocation getReturnValue:&result];
    return result;
}

@end
