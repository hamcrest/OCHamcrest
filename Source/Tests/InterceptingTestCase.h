//
// Created by Jon Reid on 9/15/15.
// Copyright (c) 2017 hamcrest.org. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HCTestFailure.h"   // Convenience import


NS_ASSUME_NONNULL_BEGIN

@interface InterceptingTestCase : XCTestCase
@property (nonatomic, strong) HCTestFailure *testFailure;
@end

NS_ASSUME_NONNULL_END
