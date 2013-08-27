#import "HCTestFailureRouter.h"


@interface HCTestFailureRouter_XCTest : NSObject <HCTestFailureRouter>

+ (BOOL)willHandleTestCase:(id)testCase;

@end
