//
//  OCHamcrest - HCWrapInMatcher.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCWrapInMatcher.h"

    // OCHamcrest
#define HC_SHORTHAND
#import "HCIsEqual.h"


OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id item)
{
    if ([item conformsToProtocol:@protocol(HCMatcher)])
        return item;
    else
        return equalTo(item);
}
