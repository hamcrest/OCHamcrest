//
//  OCHamcrest - HCWrapInMatcher.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCWrapInMatcher.h"

#import "HCIsEqual.h"


OBJC_EXPORT id<HCMatcher> HCWrapInMatcher(id matcherOrValue)
{
    if (!matcherOrValue)
        return nil;
    
    if ([matcherOrValue conformsToProtocol:@protocol(HCMatcher)])
        return matcherOrValue;
    else
        return HC_equalTo(matcherOrValue);
}
