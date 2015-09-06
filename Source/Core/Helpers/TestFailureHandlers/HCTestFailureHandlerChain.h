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

@end
