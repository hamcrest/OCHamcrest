//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>


/*!
 * @abstract Runs runloop until fulfilled, or timeout is reached.
 * @discussion Based on http://bou.io/CTTRunLoopRunUntil.html
 */
@interface HCRunloopRunner : NSObject

- (instancetype)initWithFulfillmentBlock:(BOOL (^)())fulfillmentBlock NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (void)runUntilFulfilledOrTimeout:(CFTimeInterval)timeout;

@end
