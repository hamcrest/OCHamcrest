// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2023 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIsEmptyCollection.h"

#import <OCHamcrest/HCIsEqual.h>


@implementation HCIsEmptyCollection

- (instancetype)init
{
    self = [super initWithMatcher:HC_equalTo(@0)];
    return self;
}

- (void)describeMismatchOf:(nullable id)item to:(nullable id <HCDescription>)mismatchDescription
{
    [[mismatchDescription appendText:@"was "] appendDescriptionOf:item];
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"empty collection"];
}

@end


FOUNDATION_EXPORT id HC_isEmpty(void)
{
    return [[HCIsEmptyCollection alloc] init];
}
