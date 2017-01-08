//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "HCStringStartsWith.h"


@implementation HCStringStartsWith

- (BOOL)matches:(nullable id)item
{
    if (![item respondsToSelector:@selector(hasPrefix:)])
        return NO;

    return [item hasPrefix:self.substring];
}

- (NSString *)relationship
{
    return @"starting with";
}

@end


id HC_startsWith(NSString *prefix)
{
    return [[HCStringStartsWith alloc] initWithSubstring:prefix];
}
