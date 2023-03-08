// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCUnsignedShortReturnGetter.h"


@implementation HCUnsignedShortReturnGetter

- (instancetype)initWithSuccessor:(nullable HCReturnValueGetter *)successor
{
    self = [super initWithType:@encode(unsigned short) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    unsigned short value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
