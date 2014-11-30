//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <Foundation/Foundation.h>

@protocol HCMatcher;


/**
 Wraps argument in a matcher, if necessary.

 @return The argument as-if if it is already a matcher, otherwise wrapped in an @ref equalTo matcher.

 @ingroup helpers
 */
FOUNDATION_EXPORT id <HCMatcher> HCWrapInMatcher(id matcherOrValue);
