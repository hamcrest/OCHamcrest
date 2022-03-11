// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "InterceptingTestCase.h"

#import "HCTestFailureReporter.h"
#import "HCTestFailureReporterChain.h"


@interface InterceptingTestFailureReporter : HCTestFailureReporter
@end

@implementation InterceptingTestFailureReporter

- (BOOL)willHandleFailure:(HCTestFailure *)failure
{
    return YES;
}

- (void)executeHandlingOfFailure:(HCTestFailure *)failure
{
    [failure.testCase setTestFailure:failure];
}

@end


@implementation InterceptingTestCase

- (void)setUp
{
    [super setUp];
    [HCTestFailureReporterChain addReporter:[[InterceptingTestFailureReporter alloc] init]];
}

- (void)tearDown
{
    [HCTestFailureReporterChain reset];
    [super tearDown];
}

@end
