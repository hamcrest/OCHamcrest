//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandler.h"


/*!
 * @brief Integrate OCHamcrest test failures into Cedar.
 * @discussion Instantiate a HCCedarTestFailureHandler and add it to the
 * @ref HCTestFailureHandlerChain before your Cedar tests.
 */
@interface HCCedarTestFailureHandler : HCTestFailureHandler
@end
