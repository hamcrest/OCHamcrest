//
//  HCIsLessThanOrEqualToNumber.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import "HCIsLessThanOrEqualToNumber.h"

#import "HCOrderingComparison.h"


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToChar(char value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToDouble(double value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToFloat(float value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToInt(int value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToLong(long value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToLongLong(long long value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToShort(short value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedChar(unsigned char value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedInt(unsigned int value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedLong(unsigned long value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedLongLong(unsigned long long value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedShort(unsigned short value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToInteger(NSInteger value)
{
    return HC_lessThanOrEqualTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedInteger(NSUInteger value)
{
    return HC_lessThanOrEqualTo(@(value));
}
