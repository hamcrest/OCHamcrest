//
//  IsGreaterThanNumberTest.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

// Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsGreaterThanNumber.h>

// Test support
#import "AbstractMatcherTest.h"

@interface IsGreaterThanCharTest : AbstractMatcherTest
@end

@implementation IsGreaterThanCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large char", greaterThanChar((char)0), [NSNumber numberWithChar:CHAR_MAX]);
    assertMatches(@"Small char", greaterThanChar(CHAR_MIN), [NSNumber numberWithChar:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MIN]);
}

@end


@interface IsGreaterThanDoubleTest : AbstractMatcherTest
@end

@implementation IsGreaterThanDoubleTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}
- (void)testComparesWithNSNumber
{
    assertMatches(@"Large double", greaterThanDouble(0), [NSNumber numberWithDouble:DBL_MAX]);
    assertMatches(@"Small double", greaterThanDouble(-DBL_MAX), [NSNumber numberWithDouble:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MIN]);
}

@end


@interface IsGreaterThanFloatTest : AbstractMatcherTest
@end

@implementation IsGreaterThanFloatTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large float", greaterThanFloat(0), [NSNumber numberWithFloat:FLT_MAX]);
    assertMatches(@"Small float", greaterThanFloat(-FLT_MAX), [NSNumber numberWithFloat:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MIN]);
}

@end


@interface IsGreaterThanIntTest : AbstractMatcherTest
@end

@implementation IsGreaterThanIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large int", greaterThanInt(0), [NSNumber numberWithInt:INT_MAX]);
    assertMatches(@"Small int", greaterThanInt(INT_MIN), [NSNumber numberWithInt:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanInt(INT_MAX), [NSNumber numberWithInt:INT_MIN]);
}

@end


@interface IsGreaterThanLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long", greaterThanLong(0), [NSNumber numberWithLong:LONG_MAX]);
    assertMatches(@"Small long", greaterThanLong(LONG_MIN), [NSNumber numberWithLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanLong(LONG_MAX), [NSNumber numberWithLong:LONG_MIN]);
}

@end


@interface IsGreaterThanLongLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long long", greaterThanLongLong(0), [NSNumber numberWithLongLong:LLONG_MAX]);
    assertMatches(@"Small long long", greaterThanLongLong(LLONG_MIN), [NSNumber numberWithLongLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MIN]);
}

@end


@interface IsGreaterThanShortTest : AbstractMatcherTest
@end

@implementation IsGreaterThanShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large short", greaterThanShort(0), [NSNumber numberWithShort:SHRT_MAX]);
    assertMatches(@"Small short", greaterThanShort(SHRT_MIN), [NSNumber numberWithShort:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MIN]);
}

@end


@interface IsGreaterThanUnsignedCharTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned char", greaterThanUnsignedChar(0), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedChar(CHAR_MAX), [NSNumber numberWithUnsignedChar:0]);
}

@end


@interface IsGreaterThanUnsignedIntTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned int", greaterThanUnsignedInt(0), [NSNumber numberWithUnsignedInt:UINT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedInt(INT_MAX), [NSNumber numberWithUnsignedInt:0]);
}

@end


@interface IsGreaterThanUnsignedLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long", greaterThanUnsignedLong(0), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedLong(LONG_MAX), [NSNumber numberWithUnsignedLong:0]);
}

@end


@interface IsGreaterThanUnsignedLongLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long long", greaterThanUnsignedLongLong(0), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:0]);
}

@end


@interface IsGreaterThanUnsignedShortTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned short", greaterThanUnsignedShort(0), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:0]);
}

@end


@interface IsGreaterThanIntegerTest : AbstractMatcherTest
@end

@implementation IsGreaterThanIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSInteger", greaterThanInteger(0), [NSNumber numberWithInteger:INT_MAX]);
    assertMatches(@"Small NSInteger", greaterThanInteger(INT_MIN), [NSNumber numberWithInteger:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanInteger(INT_MAX), [NSNumber numberWithInteger:INT_MIN]);
}

@end


@interface IsGreaterThanUnsignedIntegerTest : AbstractMatcherTest
@end

@implementation IsGreaterThanUnsignedIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"NSUInteger", greaterThanUnsignedInteger(0), [NSNumber numberWithUnsignedInteger:UINT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanUnsignedInteger(INT_MAX), [NSNumber numberWithUnsignedInteger:0]);
}

@end
