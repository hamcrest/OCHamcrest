#import "HCTestFailureRouterFactory.h"

#import "HCTestFailureRouter_OCUnit.h"
#import "HCTestFailureRouter_XCTest.h"
#import "HCTestFailureRouter.h"


@implementation HCTestFailureRouterFactory

+ (HCTestFailureRouter *)routerForTestCaseType:(id)testCase
{
    if ([HCTestFailureRouter_XCTest willHandleTestCase:testCase])
        return [[HCTestFailureRouter_XCTest alloc] init];
    else if ([HCTestFailureRouter_OCUnit willHandleTestCase:testCase])
        return [[HCTestFailureRouter_OCUnit alloc] init];
    else
        return [[HCTestFailureRouter alloc] init];
}

@end
