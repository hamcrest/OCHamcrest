//
//  OCHamcrest - HCUnsignedCharReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCUnsignedCharReturnTypeHandler.h"


@implementation HCUnsignedCharReturnTypeHandler

- (instancetype)init
{
    self = [super initWithType:@encode(unsigned char)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    unsigned char value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
