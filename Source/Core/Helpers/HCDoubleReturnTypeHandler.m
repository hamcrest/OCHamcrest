//
//  OCHamcrest - HCDoubleReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCDoubleReturnTypeHandler.h"


@implementation HCDoubleReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(double)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    double value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
