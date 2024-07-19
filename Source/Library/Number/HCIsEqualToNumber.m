// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCIsEqualToNumber.h"

#import <OCHamcrest/HCIsEqual.h>


FOUNDATION_EXPORT id<HCMatcher> HC_equalToChar(char value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToDouble(double value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToFloat(float value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToInt(int value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToLong(long value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToLongLong(long long value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToShort(short value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedChar(unsigned char value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedInt(unsigned int value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedLong(unsigned long value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedLongLong(unsigned long long value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedShort(unsigned short value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToInteger(NSInteger value)
{
    return HC_equalTo(@(value));
}

FOUNDATION_EXPORT id<HCMatcher> HC_equalToUnsignedInteger(NSUInteger value)
{
    return HC_equalTo(@(value));
}
