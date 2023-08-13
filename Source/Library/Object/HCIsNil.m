// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIsNil.h"

#import <OCHamcrest/HCIsNot.h>


@implementation HCIsNil

- (BOOL)matches:(nullable id)item
{
    return item == nil;
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"nil"];
}

@end


id HC_nilValue(void)
{
    return [[HCIsNil alloc] init];
}

id HC_notNilValue(void)
{
    return HC_isNot([[HCIsNil alloc] init]);
}
