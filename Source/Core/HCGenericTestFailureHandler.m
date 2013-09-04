#import "HCGenericTestFailureHandler.h"

#import "HCTestFailure.h"


@implementation HCGenericTestFailureHandler

@synthesize successor = _successor;

- (void)handleFailure:(HCTestFailure *)failure
{
    NSException *exception = [self createExceptionForFailure:failure];
    [exception raise];
}

- (NSException *)createExceptionForFailure:(HCTestFailure *)failure
{
    NSString *failureReason = [NSString stringWithFormat:@"%@:%lu: matcher error: %@",
                                                         failure.fileName, (unsigned long)failure.lineNumber, failure.reason];
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}

@end
