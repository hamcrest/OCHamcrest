#import <Foundation/Foundation.h>


@interface HCTestFailureRouter : NSObject

+ (instancetype)routerForTestCaseType:(id)testCase;

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description;

@end
