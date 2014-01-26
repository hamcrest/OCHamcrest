//
//  OCHamcrest - HCReturnTypeHandler.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCReturnTypeHandler.h"


@interface HCReturnTypeHandler (SubclassResponsibility)
- (id)invocationReturnValue:(NSInvocation *)invocation;
@end


@implementation HCReturnTypeHandler
{
    char const *_handlerType;
}

- (instancetype)initWithType:(char const *)handlerType
{
    self = [super init];
    if (self)
        _handlerType = handlerType;
    return self;
}

- (BOOL)willHandleReturnType:(char const *)returnType
{
    return strcmp(returnType, _handlerType) == 0;
}

- (id)valueForReturnType:(char const *)type fromInvocation:(NSInvocation *)invocation
{
    if ([self willHandleReturnType:type])
        return [self invocationReturnValue:invocation];
    else
        return [self.successor valueForReturnType:type fromInvocation:invocation];
}

@end
