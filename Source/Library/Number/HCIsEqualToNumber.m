//
//  OCHamcrest - HCIsEqualToNumber.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsEqualToNumber.h"

#import "HCIsEqual.h"
#import "HCDescription.h"


#define DEFINE_EQUAL_TO_NUMBER(name, type)                                  \
    OBJC_EXPORT id<HCMatcher> HC_equalTo ## name(type value)                \
    {                                                                       \
        return [HCIsEqual isEqualTo:[NSNumber numberWith ## name :value]];  \
    }

DEFINE_EQUAL_TO_NUMBER(Char, char)
DEFINE_EQUAL_TO_NUMBER(Double, double)
DEFINE_EQUAL_TO_NUMBER(Float, float)
DEFINE_EQUAL_TO_NUMBER(Int, int)
DEFINE_EQUAL_TO_NUMBER(Long, long)
DEFINE_EQUAL_TO_NUMBER(LongLong, long long)
DEFINE_EQUAL_TO_NUMBER(Short, short)
DEFINE_EQUAL_TO_NUMBER(UnsignedChar, unsigned char)
DEFINE_EQUAL_TO_NUMBER(UnsignedInt, unsigned int)
DEFINE_EQUAL_TO_NUMBER(UnsignedLong, unsigned long)
DEFINE_EQUAL_TO_NUMBER(UnsignedLongLong, unsigned long long)
DEFINE_EQUAL_TO_NUMBER(UnsignedShort, unsigned short)
DEFINE_EQUAL_TO_NUMBER(Integer, NSInteger)
DEFINE_EQUAL_TO_NUMBER(UnsignedInteger, NSUInteger)

OBJC_EXPORT id<HCMatcher> HC_equalToBool(BOOL value)
{
    return [[HCIsEqualToBool alloc] initWithValue:value];
}

@interface HCIsEqualToBool ()
+ (NSString*) stringForBool:(BOOL)value;
@end

@implementation HCIsEqualToBool

+ (NSString*) stringForBool:(BOOL)value
{
    return value ? @"<YES>" : @"<NO>";
}

- (id)initWithValue:(BOOL)aValue
{
    if ((self = [super init])) {
        value = aValue;
    }
    return self;
}

- (BOOL)matches:(id)item
{
    if (![item isKindOfClass:[NSNumber class]])
        return NO;
    return [item boolValue] == value;
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"a BOOL with the value of "];
    [description appendText:[HCIsEqualToBool stringForBool:value]];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [mismatchDescription appendText:@"was "];
    [mismatchDescription appendText:[HCIsEqualToBool stringForBool:[item boolValue]]];
}


@end
