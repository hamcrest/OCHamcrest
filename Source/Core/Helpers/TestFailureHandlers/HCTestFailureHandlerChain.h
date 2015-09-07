//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>

@class HCTestFailureHandler;


/**
 Manage chain-of-responsibility for handling test failures.

 @ingroup integration
 */
@interface HCTestFailureHandlerChain : NSObject

/**
 * Returns current chain of test failure handlers.
 */
+ (HCTestFailureHandler *)chain;

/**
 * Adds given test failure handler to head of chain-of-responsibility.
 */
+ (void)addHandler:(HCTestFailureHandler *)handler;

/**
 * Resets chain-of-responsibility to default.
 */
+ (void)reset;

@end


/**
 Returns chain of test failure handlers.

 @b Deprecated: Use <code>[HCTestFailureHandlerChain chain]</code> instead.

 @ingroup integration
 */
FOUNDATION_EXPORT HCTestFailureHandler *HC_testFailureHandlerChain(void) __attribute__((deprecated));
