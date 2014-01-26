//
//  OCHamcrest - HCShortReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCShortReturnTypeHandler.h"


@implementation HCShortReturnTypeHandler

- (id)init
{
    self = [super initWithType:@encode(short)];
    return self;
}

- (id)invocationReturnValue:(NSInvocation *)invocation
{
    short value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end
