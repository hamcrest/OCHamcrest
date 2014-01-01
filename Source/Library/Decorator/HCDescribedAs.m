//
//  OCHamcrest - HCDescribedAs.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCDescribedAs.h"


@interface NSString (OCHamcrest)
@end

@implementation NSString (OCHamcrest)

// Parse decimal number (-1 if not found) and return remaining string.
- (NSString *)och_getDecimalNumber:(int *)number
{
    int decimal = 0;
    BOOL readDigit = NO;

    NSUInteger length = [self length];
    NSUInteger index;
    for (index = 0; index < length; ++index)
    {
        unichar character = [self characterAtIndex:index];
        if (!isdigit(character))
            break;
        decimal = decimal * 10 + character - '0';
        readDigit = YES;
    }

    if (readDigit)
    {
        *number = decimal;
        return [self substringFromIndex:index];
    }
    else
    {
        *number = -1;
        return self;
    }
}

@end


@implementation HCDescribedAs

+ (instancetype)describedAs:(NSString *)description
                 forMatcher:(id <HCMatcher>)aMatcher
                 overValues:(NSArray *)templateValues
{
    return [[self alloc] initWithDescription:description
                                  forMatcher:aMatcher
                                  overValues:templateValues];
}

- (instancetype)initWithDescription:(NSString *)description
                         forMatcher:(id <HCMatcher>)aMatcher
                         overValues:(NSArray *)templateValues
{
    self = [super init];
    if (self)
    {
        descriptionTemplate = [description copy];
        matcher = aMatcher;
        values = templateValues;
    }
    return self;
}

- (BOOL)matches:(id)item
{
    return [matcher matches:item];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [matcher describeMismatchOf:item to:mismatchDescription];
}

- (void)describeTo:(id<HCDescription>)description
{
    NSArray *components = [descriptionTemplate componentsSeparatedByString:@"%"];
    BOOL firstComponent = YES;
    for (NSString *component in components)
    {
        if (firstComponent)
        {
            firstComponent = NO;
            [description appendText:component];
        }
        else
        {
            [self appendTemplateForComponent:component toDescription:description];
        }
    }
}

- (void)appendTemplateForComponent:(NSString *)component toDescription:(id <HCDescription>)description
{
    int index;
    NSString *remainder = [component och_getDecimalNumber:&index];
    if (index < 0)
        [[description appendText:@"%"] appendText:component];
    else
    {
        [description appendDescriptionOf:values[index]];
        [description appendText:remainder];
    }
}

@end


id HC_describedAs(NSString *description, id <HCMatcher> matcher, ...)
{
    NSMutableArray *valueList = [NSMutableArray array];
    
    va_list args;
    va_start(args, matcher);
    id value = va_arg(args, id);
    while (value != nil)
    {
        [valueList addObject:value];
        value = va_arg(args, id);
    }
    va_end(args);
    
    return [HCDescribedAs describedAs:description forMatcher:matcher overValues:valueList];
}
