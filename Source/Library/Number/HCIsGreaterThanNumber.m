//
//  HCIsGreaterThanNumber.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import "HCIsGreaterThanNumber.h"

#import "HCOrderingComparison.h"


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanChar(char value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanDouble(double value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanFloat(float value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanInt(int value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanLong(long value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanLongLong(long long value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanShort(short value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedChar(unsigned char value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedInt(unsigned int value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedLong(unsigned long value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedLongLong(unsigned long long value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedShort(unsigned short value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanInteger(NSInteger value)
{
    return HC_greaterThan(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedInteger(NSUInteger value)
{
    return HC_greaterThan(@(value));
}
