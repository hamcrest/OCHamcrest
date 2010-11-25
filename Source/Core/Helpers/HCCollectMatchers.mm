//
//  OCHamcrest - HCCollectMatchers.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCCollectMatchers.h"


OBJC_EXPORT NSMutableArray* HCCollectMatchers(id<HCMatcher> matcher, va_list args)
{
    NSMutableArray* matcherList = [NSMutableArray arrayWithObject:matcher];
    
    matcher = va_arg(args, id<HCMatcher>);
    while (matcher != nil)
    {
        [matcherList addObject:matcher];
        matcher = va_arg(args, id<HCMatcher>);
    }
    
    return matcherList;
}
