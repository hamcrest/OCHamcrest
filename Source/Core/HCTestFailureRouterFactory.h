#import <Foundation/Foundation.h>

@protocol HCTestFailureRouter;


/**
    Factory that creates appropriate HCTestFailureRouter.
 
    @ingroup integration
 */
@interface HCTestFailureRouterFactory : NSObject

/**
    Return HCTestFailureRouter implementer appropriate for given test case.
 */
+ (id <HCTestFailureRouter>)routerForTestCaseType:(id)testCase;

@end
