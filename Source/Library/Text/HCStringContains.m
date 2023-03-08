// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCStringContains.h"


@implementation HCStringContains

- (BOOL)matches:(nullable id)item
{
    if (![item respondsToSelector:@selector(rangeOfString:)])
        return NO;

    return [item rangeOfString:self.substring].location != NSNotFound;
}

- (NSString *)relationship
{
    return @"containing";
}

@end


id <HCMatcher> HC_containsSubstring(NSString *substring)
{
    return [[HCStringContains alloc] initWithSubstring:substring];
}
