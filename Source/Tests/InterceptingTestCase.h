//
// Created by Jon Reid on 9/15/15.
// Copyright (c) 2016 hamcrest.org. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HCTestFailure.h"   // Convenience import


@interface InterceptingTestCase : XCTestCase
@property (nonatomic, strong) HCTestFailure *testFailure;
@end
