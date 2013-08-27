#import <Foundation/Foundation.h>


@protocol HCTestFailureHandler <NSObject>

/**
    Answer YES if this class will handle on error on the given test case.
 */
+ (BOOL)willHandleTestCase:(id)testCase;

/**
    Signal test failure at specific location.
 */
- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description;

@end
