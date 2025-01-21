// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

@import XCTest;
#import <OCHamcrest/HCTestFailureReporter.h>
#import <OCHamcrest/HCTestFailure.h>


NS_ASSUME_NONNULL_BEGIN

@interface InterceptingTestCase : XCTestCase
@property (nonatomic, strong) HCTestFailure *testFailure;
@end

NS_ASSUME_NONNULL_END
