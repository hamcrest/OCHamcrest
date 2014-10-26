//
//  HCIsGreaterThanOrEqualToNumber.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import "HCIsGreaterThanOrEqualToNumber.h"

#import "HCOrderingComparison.h"


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToChar(char value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToDouble(double value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToFloat(float value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToInt(int value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToLong(long value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToLongLong(long long value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToShort(short value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedChar(unsigned char value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedInt(unsigned int value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedLong(unsigned long value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedLongLong(unsigned long long value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedShort(unsigned short value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToInteger(NSInteger value)
{
    return HC_greaterThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedInteger(NSUInteger value)
{
    return HC_greaterThanOrEqualTo(@(value));
}
