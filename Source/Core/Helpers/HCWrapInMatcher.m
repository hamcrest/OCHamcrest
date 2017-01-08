//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "HCWrapInMatcher.h"

#import "HCIsEqual.h"


id <HCMatcher> HCWrapInMatcher(_Nullable id matcherOrValue)
{
    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    return HC_equalTo(matcherOrValue);
}
