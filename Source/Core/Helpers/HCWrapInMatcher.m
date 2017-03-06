//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "HCWrapInMatcher.h"

#import "HCIsEqual.h"


_Nullable id <HCMatcher> HCWrapInMatcher(_Nullable id matcherOrValue)
{
    if (!matcherOrValue)
        return nil;

    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    return HC_equalTo(matcherOrValue);
}
