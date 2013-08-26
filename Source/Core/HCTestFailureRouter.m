#import "HCTestFailureRouter.h"


@interface NSObject (PretendMethodsExistOnNSObjectToAvoidLinkingFrameworks)

// From SenTestingKit
+ (NSException *)failureInFile:(NSString *)filename
                        atLine:(int)lineNumber
               withDescription:(NSString *)formatString, ...;

- (void)failWithException:(NSException *)exception;

// From XCTest
- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected;

@end


static NSException *createOCUnitException(const char* fileName, int lineNumber, NSString *description)
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

static NSException *createGenericException(const char *fileName, int lineNumber, NSString *description)
{
    NSString *failureReason = [NSString stringWithFormat:@"%s:%d: matcher error: %@",
                                                         fileName, lineNumber, description];
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}
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

@implementation HCTestFailureRouter

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description
{
    if (isXCTestCase(testCase))
        signalXCTestFailure(testCase, fileName, lineNumber, description);
    else if (isSenTestCase(testCase))
        signalOCUnitTestFailure(testCase, fileName, lineNumber, description);
    else
        signalGenericTestFailure(testCase, fileName, lineNumber, description);
}

@end
