#import "HCSenTestFailureHandler.h"


@interface NSObject (PretendMethodsExistOnNSObjectToAvoidLinkingSenTestingKit)

+ (NSException *)failureInFile:(NSString *)filename
                        atLine:(int)lineNumber
               withDescription:(NSString *)formatString, ...;

- (void)failWithException:(NSException *)exception;

@end


@implementation HCSenTestFailureHandler

@synthesize successor = _successor;

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description
{
    if ([self willHandleTestCase:testCase])
    {
        NSException *exception = [self createExceptionForFileName:fileName lineNumber:lineNumber description:description];
        [testCase failWithException:exception];
    }
    else
    {
        [self.successor signalFailureInTestCase:testCase fileName:fileName lineNumber:lineNumber description:description];
    }
}

- (BOOL)willHandleTestCase:(id)testCase
{
    return [testCase respondsToSelector:@selector(failWithException:)];
}

- (NSException *)createExceptionForFileName:(const char *)fileName
                                 lineNumber:(int)lineNumber
                                description:(NSString *)description
{
    // Description expects a format string, but NSInvocation does not support varargs.
    // Mask % symbols in the string so they aren't treated as placeholders.
    description = [description stringByReplacingOccurrencesOfString:@"%"
                                                         withString:@"%%"];

    SEL selector = @selector(failureInFile:atLine:withDescription:);
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

@end
