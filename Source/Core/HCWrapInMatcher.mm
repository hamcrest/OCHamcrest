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


extern "C" {

id<HCMatcher> HC_wrapInMatcher(id item)
{
    if ([item conformsToProtocol:@protocol(HCMatcher)])
        return item;
    else
        return equalTo(item);
}

}   // extern "C"
