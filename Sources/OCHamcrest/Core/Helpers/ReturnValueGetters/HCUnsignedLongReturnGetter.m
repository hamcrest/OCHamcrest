// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCUnsignedLongReturnGetter.h"


@implementation HCUnsignedLongReturnGetter

- (instancetype)initWithSuccessor:(nullable HCReturnValueGetter *)successor
{
    self = [super initWithType:@encode(unsigned long) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    unsigned long value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
