#import "HCTestFailureHandlerFactory.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"


@implementation HCTestFailureHandlerFactory

+ (id <HCTestFailureHandler>)routerForTestCaseType:(id)testCase
{
    if ([HCXCTestFailureHandler willHandleTestCase:testCase])
        return [[HCXCTestFailureHandler alloc] init];
    else if ([HCSenTestFailureHandler willHandleTestCase:testCase])
        return [[HCSenTestFailureHandler alloc] init];
    else
        return [[HCGenericTestFailureHandler alloc] init];
}

@end
