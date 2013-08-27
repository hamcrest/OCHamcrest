#import <Foundation/Foundation.h>

@class HCTestFailureRouter;


@interface HCTestFailureRouterFactory : NSObject

+ (HCTestFailureRouter *)routerForTestCaseType:(id)testCase;

@end
