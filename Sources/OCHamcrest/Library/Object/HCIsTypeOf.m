// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIsTypeOf.h"


@implementation HCIsTypeOf

- (BOOL)matches:(nullable id)item
{
    return [item isMemberOfClass:self.theClass];
}

- (NSString *)expectation
{
    return @"an exact instance of ";
}

@end


id HC_isA(Class expectedClass)
{
    return [[HCIsTypeOf alloc] initWithClass:expectedClass];
}
