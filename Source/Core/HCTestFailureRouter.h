#import <Foundation/Foundation.h>


@protocol HCTestFailureRouter <NSObject>

/**
    Signal test failure at specific location.
 */
- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description;

@end
