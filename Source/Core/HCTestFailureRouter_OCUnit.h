#import "HCTestFailureRouter.h"


@interface HCTestFailureRouter_OCUnit : NSObject <HCTestFailureRouter>

+ (BOOL)willHandleTestCase:(id)testCase;

@end
