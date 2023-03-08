// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIntReturnGetter.h"


@implementation HCIntReturnGetter

- (instancetype)initWithSuccessor:(nullable HCReturnValueGetter *)successor
{
    self = [super initWithType:@encode(int) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    int value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
