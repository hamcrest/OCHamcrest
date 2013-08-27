#import "HCTestFailureHandler.h"


@interface HCXCTestFailureHandler : NSObject <HCTestFailureHandler>

+ (BOOL)willHandleTestCase:(id)testCase;

@end
