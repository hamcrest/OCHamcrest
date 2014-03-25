//
//  OCHamcrest - HCUnsignedLongReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCUnsignedLongReturnTypeHandler.h"


@implementation HCUnsignedLongReturnTypeHandler

- (instancetype)initWithSuccessor:(HCReturnTypeHandler *)successor
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
