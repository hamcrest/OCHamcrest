//
//  OCHamcrest - HCUnsignedIntReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCUnsignedIntReturnTypeHandler.h"


@implementation HCUnsignedIntReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(unsigned int)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    unsigned int value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
