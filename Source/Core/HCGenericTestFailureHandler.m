#import "HCGenericTestFailureHandler.h"


@implementation HCGenericTestFailureHandler

+ (BOOL)willHandleTestCase:(id)testCase
{
    return YES;
}

- (void)signalFailureInTestCase:(id)testCase
                       fileName:(const char *)fileName
                     lineNumber:(int)lineNumber
                    description:(NSString *)description
{
    NSException *exception = [self createExceptionForFileName:fileName lineNumber:lineNumber description:description];
    [exception raise];
}

- (NSException *)createExceptionForFileName:(const char *)fileName
                                 lineNumber:(int)lineNumber
                                description:(NSString *)description
{
    NSString *failureReason = [NSString stringWithFormat:@"%s:%d: matcher error: %@",
                                                         fileName, lineNumber, description];
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}
@end
