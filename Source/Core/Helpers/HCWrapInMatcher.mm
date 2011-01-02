//
//  OCHamcrest - HCWrapInMatcher.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCWrapInMatcher.h"

    // OCHamcrest
#import "HCIsEqual.h"


OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id matcherOrValue)
{
    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    else
        return HC_equalTo(matcherOrValue);
}
