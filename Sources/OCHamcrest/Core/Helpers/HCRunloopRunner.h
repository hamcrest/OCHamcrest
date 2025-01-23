// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Runs runloop until fulfilled, or timeout is reached.
 * @discussion Based on http://bou.io/CTTRunLoopRunUntil.html
 */
@interface HCRunloopRunner : NSObject

- (instancetype)initWithFulfillmentBlock:(BOOL (^)(void))fulfillmentBlock NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (void)runUntilFulfilledOrTimeout:(CFTimeInterval)timeout;

@end

NS_ASSUME_NONNULL_END
