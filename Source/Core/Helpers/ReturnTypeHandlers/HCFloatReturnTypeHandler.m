//
//  OCHamcrest - HCFloatReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCFloatReturnTypeHandler.h"


@implementation HCFloatReturnTypeHandler

- (instancetype)initWithSuccessor:(HCReturnTypeHandler *)successor
{
    self = [super initWithType:@encode(float) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    float value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
