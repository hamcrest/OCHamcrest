//
//  HCIsLessThanNumber.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import "HCIsLessThanNumber.h"

#import "HCOrderingComparison.h"


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanChar(char value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanDouble(double value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanFloat(float value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanInt(int value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanLong(long value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanLongLong(long long value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanShort(short value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedChar(unsigned char value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedInt(unsigned int value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedLong(unsigned long value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedLongLong(unsigned long long value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedShort(unsigned short value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanInteger(NSInteger value)
{
    return HC_lessThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedInteger(NSUInteger value)
{
    return HC_lessThan(@(value));
}
