//
//  OCHamcrest - HCWrapInMatcher.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <objc/objc-api.h>

@protocol HCMatcher;


/**
    Returns \a item wrapped (if necessary) in an HCIsEqual matcher.
    
    \a item is returned as-is if it is already an HCMatcher.

    \ingroup helpers
 */
OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id item);
