#import "HCXCTestFailureHandler.h"


@interface NSObject (PretendMethodExistsOnNSObjectToAvoidLinkingXCTest)

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected;

@end


@implementation HCXCTestFailureHandler

@synthesize successor = _successor;

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description
{
    if ([self willHandleTestCase:testCase])
    {
        [testCase recordFailureWithDescription:description
                                        inFile:[NSString stringWithUTF8String:fileName]
                                        atLine:(NSUInteger)lineNumber
                                      expected:YES];
    }
    else
    {
        [self.successor signalFailureInTestCase:testCase fileName:fileName lineNumber:lineNumber description:description];
    }
}

- (BOOL)willHandleTestCase:(id)testCase
{
    return [testCase respondsToSelector:@selector(recordFailureWithDescription:inFile:atLine:expected:)];
}

@end
