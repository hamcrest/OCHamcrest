#import "HCTestFailureRouter.h"

#import "HCTestFailureRouter_OCUnit.h"
#import "HCTestFailureRouter_XCTest.h"


@implementation HCTestFailureRouter

+ (instancetype)routerForTestCaseType:(id)testCase
{
    if ([HCTestFailureRouter_XCTest willHandleTestCase:testCase])
        return [[HCTestFailureRouter_XCTest alloc] init];
    else if ([HCTestFailureRouter_OCUnit willHandleTestCase:testCase])
        return [[HCTestFailureRouter_OCUnit alloc] init];
    else
        return [[self alloc] init];
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
