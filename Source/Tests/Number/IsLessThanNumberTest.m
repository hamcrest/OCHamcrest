//
//  IsLessThanNumberTest.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

// Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsLessThanNumber.h>

// Test support
#import "AbstractMatcherTest.h"

@interface IsLessThanCharTest : AbstractMatcherTest
@end

@implementation IsLessThanCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large char", lessThanChar(CHAR_MAX), [NSNumber numberWithChar:0]);
    assertMatches(@"Small char", lessThanChar((char)0), [NSNumber numberWithChar:CHAR_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanChar(CHAR_MIN), [NSNumber numberWithChar:CHAR_MAX]);
}

@end


@interface IsLessThanDoubleTest : AbstractMatcherTest
@end

@implementation IsLessThanDoubleTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}
- (void)testComparesWithNSNumber
{
    assertMatches(@"Large double", lessThanDouble(DBL_MAX), [NSNumber numberWithDouble:0]);
    assertMatches(@"Small double", lessThanDouble(0), [NSNumber numberWithDouble:-DBL_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanDouble(DBL_MIN), [NSNumber numberWithDouble:DBL_MAX]);
}

@end


@interface IsLessThanFloatTest : AbstractMatcherTest
@end

@implementation IsLessThanFloatTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large float", lessThanFloat(FLT_MAX), [NSNumber numberWithFloat:0]);
    assertMatches(@"Small float", lessThanFloat(0), [NSNumber numberWithFloat:-FLT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanFloat(FLT_MIN), [NSNumber numberWithFloat:FLT_MAX]);
}

@end


@interface IsLessThanIntTest : AbstractMatcherTest
@end

@implementation IsLessThanIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large int", lessThanInt(INT_MAX), [NSNumber numberWithInt:0]);
    assertMatches(@"Small int", lessThanInt(0), [NSNumber numberWithInt:INT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanInt(INT_MIN), [NSNumber numberWithInt:INT_MAX]);
}

@end


@interface IsLessThanLongTest : AbstractMatcherTest
@end

@implementation IsLessThanLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long", lessThanLong(LONG_MAX), [NSNumber numberWithLong:0]);
    assertMatches(@"Small long", lessThanLong(0), [NSNumber numberWithLong:LONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanLong(LONG_MIN), [NSNumber numberWithLong:LONG_MAX]);
}

@end


@interface IsLessThanLongLongTest : AbstractMatcherTest
@end

@implementation IsLessThanLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long long", lessThanLongLong(LLONG_MAX), [NSNumber numberWithLongLong:0]);
    assertMatches(@"Small long long", lessThanLongLong(0), [NSNumber numberWithLongLong:LLONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanLongLong(LLONG_MIN), [NSNumber numberWithLongLong:LLONG_MAX]);
}

@end


@interface IsLessThanShortTest : AbstractMatcherTest
@end

@implementation IsLessThanShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large short", lessThanShort(SHRT_MAX), [NSNumber numberWithShort:0]);
    assertMatches(@"Small short", lessThanShort(0), [NSNumber numberWithShort:SHRT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanShort(SHRT_MIN), [NSNumber numberWithShort:SHRT_MAX]);
}

@end


@interface IsLessThanUnsignedCharTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned char", lessThanUnsignedChar(UCHAR_MAX), [NSNumber numberWithUnsignedChar:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedChar(0), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
}

@end


@interface IsLessThanUnsignedIntTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned int", lessThanUnsignedInt(UINT_MAX), [NSNumber numberWithUnsignedInt:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedInt(0), [NSNumber numberWithUnsignedInt:UINT_MAX]);
}

@end


@interface IsLessThanUnsignedLongTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long", lessThanUnsignedLong(ULONG_MAX), [NSNumber numberWithUnsignedLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedLong(0), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
}

@end


@interface IsLessThanUnsignedLongLongTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long long", lessThanUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedLongLong(0), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
}

@end


@interface IsLessThanUnsignedShortTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned short", lessThanUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedShort(0), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
}

@end


@interface IsLessThanIntegerTest : AbstractMatcherTest
@end

@implementation IsLessThanIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSInteger", lessThanInteger(NSIntegerMax), [NSNumber numberWithInteger:0]);
    assertMatches(@"Small NSInteger", lessThanInteger(0), [NSNumber numberWithInteger:NSIntegerMin]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanInteger(NSIntegerMin), [NSNumber numberWithInteger:NSIntegerMax]);
}

@end


@interface IsLessThanUnsignedIntegerTest : AbstractMatcherTest
@end

@implementation IsLessThanUnsignedIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"NSUInteger", lessThanUnsignedInteger(NSUIntegerMax), [NSNumber numberWithUnsignedInteger:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanUnsignedInteger(0), [NSNumber numberWithUnsignedInteger:NSUIntegerMax]);
}

@end
