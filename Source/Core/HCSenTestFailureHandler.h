#import "HCTestFailureHandler.h"


@interface HCSenTestFailureHandler : NSObject <HCTestFailureHandler>

+ (BOOL)willHandleTestCase:(id)testCase;

@end
