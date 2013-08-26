#import "HCTestFailureRouter_XCTest.h"


@interface NSObject (PretendMethodExistsOnNSObjectToAvoidLinkingXCTest)

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected;

@end


@implementation HCTestFailureRouter_XCTest

+ (BOOL)willHandleTestCase:(id)testCase
{
    return [testCase respondsToSelector:@selector(recordFailureWithDescription:inFile:atLine:expected:)];
}

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description
{
    [testCase recordFailureWithDescription:description
                                    inFile:[NSString stringWithUTF8String:fileName]
                                    atLine:(NSUInteger)lineNumber
                                  expected:YES];
}

@end
