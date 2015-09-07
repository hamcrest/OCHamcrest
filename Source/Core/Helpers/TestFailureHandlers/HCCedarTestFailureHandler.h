//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandler.h"


/**
 * Integrate OCHamcrest test failures into Cedar.
 *
 * Instantiate a @c HCCedarTestFailureHandler and add it to the @HCTestFailureHandlerChain before
 * your Cedar tests.
 */
@interface HCCedarTestFailureHandler : HCTestFailureHandler
@end
