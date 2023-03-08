// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCTestFailureReporterChain.h"

#import "HCGenericTestFailureReporter.h"
#import "HCSenTestFailureReporter.h"
#import "HCXCTestFailureReporter.h"
#import "HCXCTestIssueFailureReporter.h"

static HCTestFailureReporter *chainHead = nil;


@implementation HCTestFailureReporterChain

+ (HCTestFailureReporter *)reporterChain
{
    if (!chainHead)
    {
        HCTestFailureReporter *xctestIssueReporter = [[HCXCTestIssueFailureReporter alloc] init];
        HCTestFailureReporter *xctestReporter = [[HCXCTestFailureReporter alloc] init];
        HCTestFailureReporter *ocunitReporter = [[HCSenTestFailureReporter alloc] init];
        HCTestFailureReporter *genericReporter = [[HCGenericTestFailureReporter alloc] init];

        chainHead = xctestIssueReporter;
        xctestIssueReporter.successor = xctestReporter;
        xctestReporter.successor = ocunitReporter;
        ocunitReporter.successor = genericReporter;
    }
    return chainHead;
}

+ (void)addReporter:(HCTestFailureReporter *)reporter
{
    reporter.successor = [self reporterChain];
    chainHead = reporter;
}

+ (void)reset
{
    chainHead = nil;
}

@end
