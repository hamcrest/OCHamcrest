#import "HCTestFailureRouter.h"


@interface HCTestFailureRouter_OCUnit : HCTestFailureRouter

+ (BOOL)willHandleTestCase:(id)testCase;

@end
