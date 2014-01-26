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

- (instancetype)init
{
    self = [super initWithType:@encode(float)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    float value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
