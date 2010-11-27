//
//  OCHamcrest - HCWrapInMatcher.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <objc/objc-api.h>

@protocol HCMatcher;


/**
    Wraps argument in a matcher, if necessary.
    \return The argument as-if if it is already a matcher, otherwise wrapped an \ref equalTo matcher.
    \ingroup helpers
 */
OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id matcherOrValue);
