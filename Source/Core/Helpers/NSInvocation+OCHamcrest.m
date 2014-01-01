//
//  OCHamcrest - NSInvocation+OCHamcrest.m
//  Code patterned after NSInvocation+Simple.m by Karl Stenerud (Copyright 2011 KarlStenerud). See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "NSInvocation+OCHamcrest.h"


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
    id result = nil;
    const char *returnType = [[self methodSignature] methodReturnType];
    if (strcmp(returnType, @encode(id)) == 0)
    {
        __unsafe_unretained id value;
        [self getReturnValue:&value];
        result = value;
    }
    else if (strcmp(returnType, @encode(char)) == 0)
    {
        char value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(BOOL)) == 0)
    {
        BOOL value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(int)) == 0)
    {
        int value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(short)) == 0)
    {
        short value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(long)) == 0)
    {
        long value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(long long)) == 0)
    {
        long long value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(unsigned char)) == 0)
    {
        unsigned char value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(unsigned int)) == 0)
    {
        unsigned int value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(unsigned short)) == 0)
    {
        unsigned short value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(unsigned long)) == 0)
    {
        unsigned long value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(unsigned long long)) == 0)
    {
        unsigned long long value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(float)) == 0)
    {
        float value;
        [self getReturnValue:&value];
        result = @(value);
    }
    else if (strcmp(returnType, @encode(double)) == 0)
    {
        double value;
        [self getReturnValue:&value];
        result = @(value);
    }

    return result;
}

@end
