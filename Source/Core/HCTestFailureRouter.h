#import <Foundation/Foundation.h>


/**
    Base class for routing test failure to appropriate test framework.
 
    @ingroup integration
 */
@interface HCTestFailureRouter : NSObject

/**
    Signal test failure at specific location.
 */
- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description;

@end
