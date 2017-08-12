//  OCHamcrest by Jon Reid, https://qualitycoding.org/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

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
