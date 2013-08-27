#import <Foundation/Foundation.h>

@class HCTestFailureRouter;


/**
    Factory that creates appropriate HCTestFailureRouter.
 
    @ingroup integration
 */
@interface HCTestFailureRouterFactory : NSObject

/**
    Return HCTestFailureRouter subclass appropriate for given test case.
 
    @param testCase  Test case for arbitrary test runner.
 
    @return HCTestFailureRouter subclass to use.
 */
+ (HCTestFailureRouter *)routerForTestCaseType:(id)testCase;

@end
