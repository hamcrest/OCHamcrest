// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCTestFailureReporter.h"

@interface HCTestFailureReporter (SubclassResponsibility)
- (BOOL)willHandleFailure:(HCTestFailure *)failure;
- (void)executeHandlingOfFailure:(HCTestFailure *)failure;
@end


@implementation HCTestFailureReporter

- (void)handleFailure:(HCTestFailure *)failure
{
    if ([self willHandleFailure:failure])
        [self executeHandlingOfFailure:failure];
    else
        [self.successor handleFailure:failure];
}

@end
