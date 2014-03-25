//
//  OCHamcrest - HCUnsignedLongLongReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCUnsignedLongLongReturnTypeHandler.h"


@implementation HCUnsignedLongLongReturnTypeHandler

- (instancetype)init
{
    self = [super initWithType:@encode(unsigned long long)];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    unsigned long long value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
