//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCCedarTestFailureReporter.h"
#import "HCTestFailure.h"


@interface NSException (PretendMethodExistsOnNSExceptionToAvoidLinkingCedar)
+ (id)specFailureWithReason:(NSString *)reason fileName:(NSString *)fileName lineNumber:(int)lineNumber;
@end


@implementation HCCedarTestFailureReporter

- (BOOL)willHandleFailure:(HCTestFailure *)failure
{
    return NSClassFromString(@"CDRSpecFailure") != nil;
}

- (void)executeHandlingOfFailure:(HCTestFailure *)failure
{
    Class specFailureClass = NSClassFromString(@"CDRSpecFailure");
    NSException *specFailure = [specFailureClass specFailureWithReason:failure.reason
                                                              fileName:failure.fileName
                                                            lineNumber:failure.lineNumber];
    [specFailure raise];
}

@end
