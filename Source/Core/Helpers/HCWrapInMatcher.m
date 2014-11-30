//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "HCWrapInMatcher.h"

#import "HCIsEqual.h"


id <HCMatcher> HCWrapInMatcher(id matcherOrValue)
{
    if (!matcherOrValue)
        return nil;

    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    return HC_equalTo(matcherOrValue);
}
