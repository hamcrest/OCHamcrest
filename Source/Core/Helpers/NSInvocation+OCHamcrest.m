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
    char const *returnType = [[self methodSignature] methodReturnType];
    if ([self och_isId:returnType])
        result = [self och_idReturnValue];
    else if ([self och_isChar:returnType])
        result = [self och_charReturnValue];
    else if ([self och_isBool:returnType])
        result = [self och_boolReturnValue];
    else if ([self och_isInt:returnType])
        result = [self och_intReturnValue];
    else if ([self och_isShort:returnType])
        result = [self och_shortReturnValue];
    else if ([self och_isLong:returnType])
        result = [self och_longReturnValue];
    else if ([self och_isLongLong:returnType])
        result = [self och_longLongReturnValue];
    else if ([self och_isUnsignedChar:returnType])
        result = [self och_unsignedCharReturnValue];
    else if ([self och_isUnsignedInt:returnType])
        result = [self och_unsignedIntReturnValue];
    else if ([self och_isUnsignedShort:returnType])
        result = [self och_unsignedShortReturnValue];
    else if ([self och_isUnsignedLong:returnType])
        result = [self och_unsignedLongReturnValue];
    else if ([self och_isUnsignedLongLong:returnType])
        result = [self och_unsignedLongLongReturnValue];
    else if ([self och_isFloat:returnType])
        result = [self och_floatReturnValue];
    else if ([self och_isDouble:returnType])
        result = [self och_doubleReturnValue];
    return result;
}

- (BOOL)och_isId:(char const *)returnType
{
    return strcmp(returnType, @encode(id)) == 0;
}

- (BOOL)och_isChar:(char const *)returnType
{
    return strcmp(returnType, @encode(char)) == 0;
}

- (BOOL)och_isBool:(char const *)returnType
{
    return strcmp(returnType, @encode(BOOL)) == 0;
}

- (BOOL)och_isInt:(char const *)returnType
{
    return strcmp(returnType, @encode(int)) == 0;
}

- (BOOL)och_isShort:(char const *)returnType
{
    return strcmp(returnType, @encode(short)) == 0;
}

- (BOOL)och_isLong:(char const *)returnType
{
    return strcmp(returnType, @encode(long)) == 0;
}

- (BOOL)och_isLongLong:(char const *)returnType
{
    return strcmp(returnType, @encode(long long)) == 0;
}

- (BOOL)och_isUnsignedChar:(char const *)returnType
{
    return strcmp(returnType, @encode(unsigned char)) == 0;
}

- (BOOL)och_isUnsignedInt:(char const *)returnType
{
    return strcmp(returnType, @encode(unsigned int)) == 0;
}

- (BOOL)och_isUnsignedShort:(char const *)returnType
{
    return strcmp(returnType, @encode(unsigned short)) == 0;
}

- (BOOL)och_isUnsignedLong:(char const *)returnType
{
    return strcmp(returnType, @encode(unsigned long)) == 0;
}

- (BOOL)och_isUnsignedLongLong:(char const *)returnType
{
    return strcmp(returnType, @encode(unsigned long long)) == 0;
}

- (BOOL)och_isFloat:(char const *)returnType
{
    return strcmp(returnType, @encode(float)) == 0;
}

- (BOOL)och_isDouble:(char const *)returnType
{
    return strcmp(returnType, @encode(double)) == 0;
}

- (id)och_idReturnValue
{
    __unsafe_unretained id value;
    [self getReturnValue:&value];
    return value;
}

- (NSNumber *)och_charReturnValue
{
    char value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_boolReturnValue
{
    BOOL value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_intReturnValue
{
    int value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_shortReturnValue
{
    short value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_longReturnValue
{
    long value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_longLongReturnValue
{
    long long value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_unsignedCharReturnValue
{
    unsigned char value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_unsignedIntReturnValue
{
    unsigned int value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_unsignedShortReturnValue
{
    unsigned short value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_unsignedLongReturnValue
{
    unsigned long value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_unsignedLongLongReturnValue
{
    unsigned long long value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_floatReturnValue
{
    float value;
    [self getReturnValue:&value];
    return @(value);
}

- (NSNumber *)och_doubleReturnValue
{
    double value;
    [self getReturnValue:&value];
    return @(value);
}

@end
