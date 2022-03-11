// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIsInstanceOf.h"


@implementation HCIsInstanceOf

- (BOOL)matches:(nullable id)item
{
    return [item isKindOfClass:self.theClass];
}

- (NSString *)expectation
{
    return @"an instance of ";
}

@end


id HC_instanceOf(Class expectedClass)
{
    return [[HCIsInstanceOf alloc] initWithClass:expectedClass];
}
