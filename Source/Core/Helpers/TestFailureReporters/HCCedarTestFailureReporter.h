//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureReporter.h"


/*!
 * @brief Integrate OCHamcrest test failures into Cedar.
 * @discussion Instantiate a HCCedarTestFailureReporter and add it to the
 * @ref HCTestFailureReporterChain before your Cedar tests.
 */
@interface HCCedarTestFailureReporter : HCTestFailureReporter
@end
