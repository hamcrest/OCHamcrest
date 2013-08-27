#import "HCXCTestFailureHandler.h"
#import "HCTestFailure.h"


@interface NSObject (PretendMethodExistsOnNSObjectToAvoidLinkingXCTest)

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected;

@end


@implementation HCXCTestFailureHandler

@synthesize successor = _successor;

- (void)signalFailure:(HCTestFailure *)failure
{
    if ([self willHandleTestCase:failure.testCase])
    {
        [failure.testCase recordFailureWithDescription:failure.reason
                                                inFile:failure.fileName
                                                atLine:failure.lineNumber
                                              expected:YES];
    }
    else
    {
        [self.successor signalFailure:failure];
    }
}

- (BOOL)willHandleTestCase:(id)testCase
{
    return [testCase respondsToSelector:@selector(recordFailureWithDescription:inFile:atLine:expected:)];
}

@end
