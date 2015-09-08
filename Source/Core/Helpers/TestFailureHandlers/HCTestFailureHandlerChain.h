//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCTestFailureHandler.h>

/*!
 @brief Returns chain of test failure handlers.
 @discussion <em>Deprecated: Use <code>[HCTestFailureReporterChain chain]</code> instead.</em>
 @see HCTestFailureReporterChain
 */
FOUNDATION_EXPORT HCTestFailureHandler *HC_testFailureHandlerChain(void) __attribute__((deprecated));
