#import "HCTestFailureRouter.h"


@interface HCTestFailureRouter_XCTest : HCTestFailureRouter

+ (BOOL)willHandleTestCase:(id)testCase;

@end
