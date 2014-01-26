//
//  OCHamcrest - HCUnsignedShortReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCUnsignedShortReturnTypeHandler.h"


@implementation HCUnsignedShortReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(unsigned short)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    unsigned short value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
