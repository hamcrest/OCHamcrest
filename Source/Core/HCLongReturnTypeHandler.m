//
//  OCHamcrest - HCLongReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCLongReturnTypeHandler.h"


@implementation HCLongReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(long)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    long value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
