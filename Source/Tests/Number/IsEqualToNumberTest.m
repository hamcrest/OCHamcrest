//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualToNumber.h>

#import "AbstractMatcherTest.h"


@interface IsEqualToBoolTest : AbstractMatcherTest
@end

@implementation IsEqualToBoolTest

- (void)testCopesWithNilsAndUnknownTypes
{
    BOOL irrelevant = NO;
    id matcher = equalToBool(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large BOOL", equalToBool(YES), [NSNumber numberWithBool:YES]);
    assertMatches(@"Small BOOL", equalToBool(NO), [NSNumber numberWithBool:NO]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToBool(YES), [NSNumber numberWithBool:NO]);
}

- (void)testMismatchesNonNumber
{
    assertDoesNotMatch(@"Not a number", equalToBool(NO), @"STRING");
}

- (void)testDescribesMismatchOfDifferentNumber
{
    assertMismatchDescription(@"was <YES>", equalToBool(NO), @YES);
}

- (void)testDescribesMismatchOfNonNumber
{
    assertMismatchDescriptionPrefix(@"was <NSObject:", equalToBool(NO), [[NSObject alloc] init]);
}

@end


@interface IsEqualToCharTest : AbstractMatcherTest
@end

@implementation IsEqualToCharTest

- (void)testCopesWithNilsAndUnknownTypes
{
    char irrelevant = 0;
    id matcher = equalToChar(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large char", equalToChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MAX]);
    assertMatches(@"Small char", equalToChar(CHAR_MIN), [NSNumber numberWithChar:CHAR_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToChar(CHAR_MAX), [NSNumber numberWithChar:CHAR_MIN]);
}

@end


@interface IsEqualToDoubleTest : AbstractMatcherTest
@end

@implementation IsEqualToDoubleTest

- (void)testCopesWithNilsAndUnknownTypes
{
    double irrelevant = 0;
    id matcher = equalToDouble(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large double", equalToDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MAX]);
    assertMatches(@"Small double", equalToDouble(DBL_MIN), [NSNumber numberWithDouble:DBL_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToDouble(DBL_MAX), [NSNumber numberWithDouble:DBL_MIN]);
}

@end


@interface IsEqualToFloatTest : AbstractMatcherTest
@end

@implementation IsEqualToFloatTest

- (void)testCopesWithNilsAndUnknownTypes
{
    float irrelevant = 0;
    id matcher = equalToFloat(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large float", equalToFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MAX]);
    assertMatches(@"Small float", equalToFloat(FLT_MIN), [NSNumber numberWithFloat:FLT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToFloat(FLT_MAX), [NSNumber numberWithFloat:FLT_MIN]);
}

@end


@interface IsEqualToIntTest : AbstractMatcherTest
@end

@implementation IsEqualToIntTest

- (void)testCopesWithNilsAndUnknownTypes
{
    int irrelevant = 0;
    id matcher = equalToInt(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large int", equalToInt(INT_MAX), [NSNumber numberWithInt:INT_MAX]);
    assertMatches(@"Small int", equalToInt(INT_MIN), [NSNumber numberWithInt:INT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToInt(INT_MAX), [NSNumber numberWithInt:INT_MIN]);
}

@end


@interface IsEqualToLongTest : AbstractMatcherTest
@end

@implementation IsEqualToLongTest

- (void)testCopesWithNilsAndUnknownTypes
{
    long irrelevant = 0;
    id matcher = equalToLong(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long", equalToLong(LONG_MAX), [NSNumber numberWithLong:LONG_MAX]);
    assertMatches(@"Small long", equalToLong(LONG_MIN), [NSNumber numberWithLong:LONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToLong(LONG_MAX), [NSNumber numberWithLong:LONG_MIN]);
}

@end


@interface IsEqualToLongLongTest : AbstractMatcherTest
@end

@implementation IsEqualToLongLongTest

- (void)testCopesWithNilsAndUnknownTypes
{
    long long irrelevant = 0;
    id matcher = equalToLongLong(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large long long", equalToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MAX]);
    assertMatches(@"Small long long", equalToLongLong(LLONG_MIN), [NSNumber numberWithLongLong:LLONG_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToLongLong(LLONG_MAX), [NSNumber numberWithLongLong:LLONG_MIN]);
}

@end


@interface IsEqualToShortTest : AbstractMatcherTest
@end

@implementation IsEqualToShortTest

- (void)testCopesWithNilsAndUnknownTypes
{
    short irrelevant = 0;
    id matcher = equalToShort(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large short", equalToShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MAX]);
    assertMatches(@"Small short", equalToShort(SHRT_MIN), [NSNumber numberWithShort:SHRT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToShort(SHRT_MAX), [NSNumber numberWithShort:SHRT_MIN]);
}

@end


@interface IsEqualToUnsignedCharTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedCharTest

- (void)testCopesWithNilsAndUnknownTypes
{
    unsigned char irrelevant = 0;
    id matcher = equalToUnsignedChar(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large unsigned char", equalToUnsignedChar(UCHAR_MAX), [NSNumber numberWithUnsignedChar:UCHAR_MAX]);
    assertMatches(@"Small unsigned char", equalToUnsignedChar(0), [NSNumber numberWithUnsignedChar:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedChar(CHAR_MAX), [NSNumber numberWithUnsignedChar:0]);
}

@end


@interface IsEqualToUnsignedIntTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedIntTest

- (void)testCopesWithNilsAndUnknownTypes
{
    unsigned int irrelevant = 0;
    id matcher = equalToUnsignedInt(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large unsigned int", equalToUnsignedInt(UINT_MAX), [NSNumber numberWithUnsignedInt:UINT_MAX]);
    assertMatches(@"Small unsigned int", equalToUnsignedInt(0), [NSNumber numberWithUnsignedInt:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedInt(INT_MAX), [NSNumber numberWithUnsignedInt:0]);
}

@end


@interface IsEqualToUnsignedLongTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedLongTest

- (void)testCopesWithNilsAndUnknownTypes
{
    unsigned long irrelevant = 0;
    id matcher = equalToUnsignedLong(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large unsigned long", equalToUnsignedLong(ULONG_MAX), [NSNumber numberWithUnsignedLong:ULONG_MAX]);
    assertMatches(@"Small unsigned long", equalToUnsignedLong(0), [NSNumber numberWithUnsignedLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedLong(LONG_MAX), [NSNumber numberWithUnsignedLong:0]);
}

@end


@interface IsEqualToUnsignedLongLongTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedLongLongTest

- (void)testCopesWithNilsAndUnknownTypes
{
    unsigned long long irrelevant = 0;
    id matcher = equalToUnsignedLongLong(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large unsigned long long", equalToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:ULLONG_MAX]);
    assertMatches(@"Small unsigned long long", equalToUnsignedLongLong(0), [NSNumber numberWithUnsignedLongLong:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedLongLong(ULLONG_MAX), [NSNumber numberWithUnsignedLongLong:0]);
}

@end


@interface IsEqualToUnsignedShortTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedShortTest

- (void)testCopesWithNilsAndUnknownTypes
{
    unsigned short irrelevant = 0;
    id matcher = equalToUnsignedShort(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large unsigned short", equalToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:USHRT_MAX]);
    assertMatches(@"Small unsigned short", equalToUnsignedShort(0), [NSNumber numberWithUnsignedShort:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedShort(USHRT_MAX), [NSNumber numberWithUnsignedShort:0]);
}

@end


@interface IsEqualToIntegerTest : AbstractMatcherTest
@end

@implementation IsEqualToIntegerTest

- (void)testCopesWithNilsAndUnknownTypes
{
    NSInteger irrelevant = 0;
    id matcher = equalToInteger(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSInteger", equalToInteger(INT_MAX), [NSNumber numberWithInteger:INT_MAX]);
    assertMatches(@"Small NSInteger", equalToInteger(INT_MIN), [NSNumber numberWithInteger:INT_MIN]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToInteger(INT_MAX), [NSNumber numberWithInteger:INT_MIN]);
}

@end


@interface IsEqualToUnsignedIntegerTest : AbstractMatcherTest
@end

@implementation IsEqualToUnsignedIntegerTest

- (void)testCopesWithNilsAndUnknownTypes
{
    NSUInteger irrelevant = 0;
    id matcher = equalToUnsignedInteger(irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"Large NSUInteger", equalToUnsignedInteger(UINT_MAX), [NSNumber numberWithUnsignedInteger:UINT_MAX]);
    assertMatches(@"Small NSUInteger", equalToUnsignedInteger(0), [NSNumber numberWithUnsignedInteger:0]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToUnsignedInteger(INT_MAX), [NSNumber numberWithUnsignedInteger:0]);
}

@end
