// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCWrapInMatcher.h"

#import <OCHamcrest/HCIsEqual.h>


_Nullable id <HCMatcher> HCWrapInMatcher(_Nullable id matcherOrValue)
{
    if (!matcherOrValue)
        return nil;

    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    return HC_equalTo(matcherOrValue);
}
