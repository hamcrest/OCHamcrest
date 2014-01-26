//
//  OCHamcrest - NSInvocation+OCHamcrest.m
//  Code patterned after NSInvocation+Simple.m by Karl Stenerud (Copyright 2011 KarlStenerud). See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "NSInvocation+OCHamcrest.h"

#import "HCReturnTypeHandler.h"
#import "HCReturnTypeHandlerChain.h"


@implementation NSInvocation (OCHamcrest)

+ (NSInvocation *)och_invocationWithTarget:(id)target selector:(SEL)selector
{
    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    NSInvocation *invocation= [self och_invocationWithSignature:signature selector:selector];
    [invocation setTarget:target];
    return invocation;
}

+ (NSInvocation *)och_invocationOnObjectOfType:(Class)aClass selector:(SEL)selector
{
    NSMethodSignature *signature = [aClass instanceMethodSignatureForSelector:selector];
    return [self och_invocationWithSignature:signature selector:selector];
}

+ (NSInvocation *)och_invocationWithSignature:(NSMethodSignature *)signature selector:(SEL)selector
{
    NSInvocation *invocation = [[self class] invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    return invocation;
}

- (id)och_invoke
{
    [self invoke];
    return [self och_returnValue];
}

- (id)och_returnValue
{
    HCReturnTypeHandler *chain = HC_returnTypeHandlerChain();
    char const *returnType = [[self methodSignature] methodReturnType];
    return [chain valueForReturnType:returnType fromInvocation:self];
}

@end
