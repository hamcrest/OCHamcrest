//
//  OCHamcrest - HCCollectMatchers.mm
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCCollectMatchers.h"

#import "HCWrapInMatcher.h"


OBJC_EXPORT NSMutableArray *HCCollectMatchers(id item, va_list args)
{
    NSMutableArray *matcherList = [NSMutableArray arrayWithObject:HCWrapInMatcher(item)];
    
    item = va_arg(args, id);
    while (item != nil)
    {
        [matcherList addObject:HCWrapInMatcher(item)];
        item = va_arg(args, id);
    }
    
    return matcherList;
}
