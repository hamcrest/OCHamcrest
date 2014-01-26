//
//  OCHamcrest - HCIntReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIntReturnTypeHandler.h"


@implementation HCIntReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(int)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    int value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
