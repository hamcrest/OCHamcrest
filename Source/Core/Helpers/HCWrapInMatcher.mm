//
//  OCHamcrest - HCWrapInMatcher.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCWrapInMatcher.h"

    // OCHamcrest
#import "HCIsEqual.h"


OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id item)
{
    if ([item conformsToProtocol:@protocol(HCMatcher)])
        return item;
    else
        return HC_equalTo(item);
}
