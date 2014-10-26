//
//  IsLessThanOrEqualToNumberTest.m
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

// Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsLessThanOrEqualToNumber.h>

// Test support
#import "AbstractMatcherTest.h"

@interface IsLessThanOrEqualToCharTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large char", lessThanOrEqualToChar(CHAR_MAX), [NSNumber numberWithChar:0]);
    assertMatches(@"Small char", lessThanOrEqualToChar((char)0), [NSNumber numberWithChar:CHAR_MIN]);
    assertMatches(@"Large char", lessThanOrEqualToChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MAX]);
    assertMatches(@"Small char", lessThanOrEqualToChar(CHAR_MIN), [NSNumber numberWithChar:CHAR_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToChar(CHAR_MIN), [NSNumber numberWithChar:CHAR_MAX]);
}

@end


@interface IsLessThanOrEqualToDoubleTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToDoubleTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}
- (void)testComparesWithNSNumber
{
    assertMatches(@"Large double", lessThanOrEqualToDouble(DBL_MAX), [NSNumber numberWithDouble:0]);
    assertMatches(@"Small double", lessThanOrEqualToDouble(0), [NSNumber numberWithDouble:-DBL_MAX]);
    assertMatches(@"Large double", lessThanOrEqualToDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MAX]);
    assertMatches(@"Small double", lessThanOrEqualToDouble(-DBL_MIN), [NSNumber numberWithDouble:-DBL_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToDouble(DBL_MIN), [NSNumber numberWithDouble:DBL_MAX]);
}

@end


@interface IsLessThanOrEqualToFloatTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToFloatTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large float", lessThanOrEqualToFloat(FLT_MAX), [NSNumber numberWithFloat:0]);
    assertMatches(@"Small float", lessThanOrEqualToFloat(0), [NSNumber numberWithFloat:-FLT_MAX]);
    assertMatches(@"Large float", lessThanOrEqualToFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MAX]);
    assertMatches(@"Small float", lessThanOrEqualToFloat(-FLT_MAX), [NSNumber numberWithFloat:-FLT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToFloat(FLT_MIN), [NSNumber numberWithFloat:FLT_MAX]);
}

@end


@interface IsLessThanOrEqualToIntTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large int", lessThanOrEqualToInt(INT_MAX), [NSNumber numberWithInt:0]);
    assertMatches(@"Small int", lessThanOrEqualToInt(0), [NSNumber numberWithInt:INT_MIN]);
    assertMatches(@"Large int", lessThanOrEqualToInt(INT_MAX), [NSNumber numberWithInt:INT_MAX]);
    assertMatches(@"Small int", lessThanOrEqualToInt(INT_MIN), [NSNumber numberWithInt:INT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToInt(INT_MIN), [NSNumber numberWithInt:INT_MAX]);
}

@end


@interface IsLessThanOrEqualToLongTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long", lessThanOrEqualToLong(LONG_MAX), [NSNumber numberWithLong:0]);
    assertMatches(@"Small long", lessThanOrEqualToLong(0), [NSNumber numberWithLong:LONG_MIN]);
    assertMatches(@"Large long", lessThanOrEqualToLong(LONG_MAX), [NSNumber numberWithLong:LONG_MAX]);
    assertMatches(@"Small long", lessThanOrEqualToLong(LONG_MIN), [NSNumber numberWithLong:LONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToLong(LONG_MIN), [NSNumber numberWithLong:LONG_MAX]);
}

@end


@interface IsLessThanOrEqualToLongLongTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long long", lessThanOrEqualToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:0]);
    assertMatches(@"Small long long", lessThanOrEqualToLongLong(0), [NSNumber numberWithLongLong:LLONG_MIN]);
    assertMatches(@"Large long long", lessThanOrEqualToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MAX]);
    assertMatches(@"Small long long", lessThanOrEqualToLongLong(LLONG_MIN), [NSNumber numberWithLongLong:LLONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToLongLong(LLONG_MIN), [NSNumber numberWithLongLong:LLONG_MAX]);
}

@end


@interface IsLessThanOrEqualToShortTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large short", lessThanOrEqualToShort(SHRT_MAX), [NSNumber numberWithShort:0]);
    assertMatches(@"Small short", lessThanOrEqualToShort(0), [NSNumber numberWithShort:SHRT_MIN]);
    assertMatches(@"Large short", lessThanOrEqualToShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MAX]);
    assertMatches(@"Small short", lessThanOrEqualToShort(SHRT_MIN), [NSNumber numberWithShort:SHRT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToShort(SHRT_MIN), [NSNumber numberWithShort:SHRT_MAX]);
}

@end


@interface IsLessThanOrEqualToUnsignedCharTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedCharTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned char", lessThanOrEqualToUnsignedChar(UCHAR_MAX), [NSNumber numberWithUnsignedChar:0]);
    assertMatches(@"Unsigned char", lessThanOrEqualToUnsignedChar(UCHAR_MAX), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedChar(0), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
}

@end


@interface IsLessThanOrEqualToUnsignedIntTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedIntTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned int", lessThanOrEqualToUnsignedInt(UINT_MAX), [NSNumber numberWithUnsignedInt:0]);
    assertMatches(@"Unsigned int", lessThanOrEqualToUnsignedInt(UINT_MAX), [NSNumber numberWithUnsignedInt:UINT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedInt(0), [NSNumber numberWithUnsignedInt:UINT_MAX]);
}

@end


@interface IsLessThanOrEqualToUnsignedLongTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long", lessThanOrEqualToUnsignedLong(ULONG_MAX), [NSNumber numberWithUnsignedLong:0]);
    assertMatches(@"Unsigned long", lessThanOrEqualToUnsignedLong(ULONG_MAX), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedLong(0), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
}

@end


@interface IsLessThanOrEqualToUnsignedLongLongTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedLongLongTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned long long", lessThanOrEqualToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:0]);
    assertMatches(@"Unsigned long long", lessThanOrEqualToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedLongLong(0), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
}

@end


@interface IsLessThanOrEqualToUnsignedShortTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedShortTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Unsigned short", lessThanOrEqualToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:0]);
    assertMatches(@"Unsigned short", lessThanOrEqualToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedShort(0), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
}

@end


@interface IsLessThanOrEqualToIntegerTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSInteger", lessThanOrEqualToInteger(NSIntegerMax), [NSNumber numberWithInteger:0]);
    assertMatches(@"Small NSInteger", lessThanOrEqualToInteger(0), [NSNumber numberWithInteger:NSIntegerMin]);
    assertMatches(@"Large NSInteger", lessThanOrEqualToInteger(NSIntegerMax), [NSNumber numberWithInteger:NSIntegerMax]);
    assertMatches(@"Small NSInteger", lessThanOrEqualToInteger(NSIntegerMin), [NSNumber numberWithInteger:NSIntegerMin]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToInteger(NSIntegerMin), [NSNumber numberWithInteger:NSIntegerMax]);
}

@end


@interface IsLessThanOrEqualToUnsignedIntegerTest : AbstractMatcherTest
@end

@implementation IsLessThanOrEqualToUnsignedIntegerTest

- (id <HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"NSUInteger", lessThanOrEqualToUnsignedInteger(NSUIntegerMax), [NSNumber numberWithUnsignedInteger:0]);
    assertMatches(@"NSUInteger", lessThanOrEqualToUnsignedInteger(NSUIntegerMax), [NSNumber numberWithUnsignedInteger:NSUIntegerMax]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", lessThanOrEqualToUnsignedInteger(0), [NSNumber numberWithUnsignedInteger:NSUIntegerMax]);
}

@end
