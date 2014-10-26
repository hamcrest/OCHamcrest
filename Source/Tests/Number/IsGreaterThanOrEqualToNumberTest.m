//
//  IsGreaterThanOrEqualToNumberTest.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/26/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

// Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsGreaterThanOrEqualToNumber.h>

// Test support
#import "AbstractMatcherTest.h"

@interface IsGreaterThanOrEqualToCharTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large char", greaterThanOrEqualToChar((char)0), [NSNumber numberWithChar:CHAR_MAX]);
    assertMatches(@"Small char", greaterThanOrEqualToChar(CHAR_MIN), [NSNumber numberWithChar:0]);
    assertMatches(@"Large char", greaterThanOrEqualToChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MAX]);
    assertMatches(@"Small char", greaterThanOrEqualToChar(CHAR_MIN), [NSNumber numberWithChar:CHAR_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MIN]);
}

@end


@interface IsGreaterThanOrEqualToDoubleTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToDoubleTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}
- (void)testComparesWithNSNumber
{
    assertMatches(@"Large double", greaterThanOrEqualToDouble(0), [NSNumber numberWithDouble:DBL_MAX]);
    assertMatches(@"Small double", greaterThanOrEqualToDouble(-DBL_MAX), [NSNumber numberWithDouble:0]);
    assertMatches(@"Large double", greaterThanOrEqualToDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MAX]);
    assertMatches(@"Small double", greaterThanOrEqualToDouble(-DBL_MAX), [NSNumber numberWithDouble:-DBL_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MIN]);
}

@end


@interface IsGreaterThanOrEqualToFloatTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToFloatTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large float", greaterThanOrEqualToFloat(0), [NSNumber numberWithFloat:FLT_MAX]);
    assertMatches(@"Small float", greaterThanOrEqualToFloat(-FLT_MAX), [NSNumber numberWithFloat:0]);
    assertMatches(@"Large float", greaterThanOrEqualToFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MAX]);
    assertMatches(@"Small float", greaterThanOrEqualToFloat(-FLT_MAX), [NSNumber numberWithFloat:-FLT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MIN]);
}

@end


@interface IsGreaterThanOrEqualToIntTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large int", greaterThanOrEqualToInt(0), [NSNumber numberWithInt:INT_MAX]);
    assertMatches(@"Small int", greaterThanOrEqualToInt(INT_MIN), [NSNumber numberWithInt:0]);
    assertMatches(@"Large int", greaterThanOrEqualToInt(INT_MAX), [NSNumber numberWithInt:INT_MAX]);
    assertMatches(@"Small int", greaterThanOrEqualToInt(INT_MIN), [NSNumber numberWithInt:INT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToInt(INT_MAX), [NSNumber numberWithInt:INT_MIN]);
}

@end


@interface IsGreaterThanOrEqualToLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long", greaterThanOrEqualToLong(0), [NSNumber numberWithLong:LONG_MAX]);
    assertMatches(@"Small long", greaterThanOrEqualToLong(LONG_MIN), [NSNumber numberWithLong:0]);
    assertMatches(@"Large long", greaterThanOrEqualToLong(LONG_MAX), [NSNumber numberWithLong:LONG_MAX]);
    assertMatches(@"Small long", greaterThanOrEqualToLong(LONG_MIN), [NSNumber numberWithLong:LONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToLong(LONG_MAX), [NSNumber numberWithLong:LONG_MIN]);
}

@end


@interface IsGreaterThanOrEqualToLongLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long long", greaterThanOrEqualToLongLong(0), [NSNumber numberWithLongLong:LLONG_MAX]);
    assertMatches(@"Small long long", greaterThanOrEqualToLongLong(LLONG_MIN), [NSNumber numberWithLongLong:0]);
    assertMatches(@"Large long long", greaterThanOrEqualToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MAX]);
    assertMatches(@"Small long long", greaterThanOrEqualToLongLong(LLONG_MIN), [NSNumber numberWithLongLong:LLONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MIN]);
}

@end


@interface IsGreaterThanOrEqualToShortTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large short", greaterThanOrEqualToShort(0), [NSNumber numberWithShort:SHRT_MAX]);
    assertMatches(@"Small short", greaterThanOrEqualToShort(SHRT_MIN), [NSNumber numberWithShort:0]);
    assertMatches(@"Large short", greaterThanOrEqualToShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MAX]);
    assertMatches(@"Small short", greaterThanOrEqualToShort(SHRT_MIN), [NSNumber numberWithShort:SHRT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MIN]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedCharTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned char", greaterThanOrEqualToUnsignedChar(0), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
    assertMatches(@"Unsigned char", greaterThanOrEqualToUnsignedChar(UCHAR_MAX), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedChar(CHAR_MAX), [NSNumber numberWithUnsignedChar:0]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedIntTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned int", greaterThanOrEqualToUnsignedInt(0), [NSNumber numberWithUnsignedInt:UINT_MAX]);
    assertMatches(@"Unsigned int", greaterThanOrEqualToUnsignedInt(UINT_MAX), [NSNumber numberWithUnsignedInt:UINT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedInt(INT_MAX), [NSNumber numberWithUnsignedInt:0]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long", greaterThanOrEqualToUnsignedLong(0), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
    assertMatches(@"Unsigned long", greaterThanOrEqualToUnsignedLong(ULONG_MAX), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedLong(LONG_MAX), [NSNumber numberWithUnsignedLong:0]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedLongLongTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long long", greaterThanOrEqualToUnsignedLongLong(0), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
    assertMatches(@"Unsigned long long", greaterThanOrEqualToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:0]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedShortTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned short", greaterThanOrEqualToUnsignedShort(0), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
    assertMatches(@"Unsigned short", greaterThanOrEqualToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:0]);
}

@end


@interface IsGreaterThanOrEqualToIntegerTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSInteger", greaterThanOrEqualToInteger(0), [NSNumber numberWithInteger:NSIntegerMax]);
    assertMatches(@"Small NSInteger", greaterThanOrEqualToInteger(NSIntegerMin), [NSNumber numberWithInteger:0]);
    assertMatches(@"Large NSInteger", greaterThanOrEqualToInteger(NSIntegerMax), [NSNumber numberWithInteger:NSIntegerMax]);
    assertMatches(@"Small NSInteger", greaterThanOrEqualToInteger(NSIntegerMin), [NSNumber numberWithInteger:NSIntegerMin]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToInteger(INT_MAX), [NSNumber numberWithInteger:INT_MIN]);
}

@end


@interface IsGreaterThanOrEqualToUnsignedIntegerTest : AbstractMatcherTest
@end

@implementation IsGreaterThanOrEqualToUnsignedIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"NSUInteger", greaterThanOrEqualToUnsignedInteger(0), [NSNumber numberWithUnsignedInteger:NSUIntegerMax]);
    assertMatches(@"NSUInteger", greaterThanOrEqualToUnsignedInteger(NSUIntegerMax), [NSNumber numberWithUnsignedInteger:NSUIntegerMax]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", greaterThanOrEqualToUnsignedInteger(INT_MAX), [NSNumber numberWithUnsignedInteger:0]);
}

@end
