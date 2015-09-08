//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>

@class HCTestFailureHandler;


/*!
 * @brief Manage chain-of-responsibility for reporting test failures.
 * @discussion This provides a generic way of reporting test failures without knowing about the
 * underlying test framework. By default, we try XCTest first, then SenTestingKit. If we run out of
 * options, the final catch-all is to throw an NSException describing the test failure.
 */
@interface HCTestFailureHandlerChain : NSObject

/*!
 * @brief Returns current chain of test failure handlers.
 */
+ (HCTestFailureHandler *)chain;

/*!
 * @brief Adds given test failure handler to head of chain-of-responsibility.
 */
+ (void)addHandler:(HCTestFailureHandler *)handler;

/*!
 * @brief Resets chain-of-responsibility to default.
 */
+ (void)reset;

@end


/*!
 @brief Returns chain of test failure handlers.
 @discussion <em>Deprecated: Use <code>[HCTestFailureHandlerChain chain]</code> instead.</em>
 @see HCTestFailureHandlerChain
 */
FOUNDATION_EXPORT HCTestFailureHandler *HC_testFailureHandlerChain(void) __attribute__((deprecated));
