#import <Foundation/Foundation.h>

@protocol HCTestFailureHandler;


/**
    Factory that creates appropriate HCTestFailureHandler.
 
    @ingroup integration
 */
@interface HCTestFailureHandlerFactory : NSObject

/**
    Return HCTestFailureHandler implementer appropriate for given test case.
 */
+ (id <HCTestFailureHandler>)routerForTestCaseType:(id)testCase;

@end
