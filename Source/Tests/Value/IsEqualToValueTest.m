#define HC_SHORTHAND

#import <OCHamcrest/HCValueMatcher.h>

#import "AbstractMatcherTest.h"


@interface IsEqualToPointTest : AbstractMatcherTest
@end

@implementation IsEqualToPointTest

- (id<HCMatcher>)createMatcher
{
    NSPoint irrelevant = NSMakePoint(0, 0);
    return equalToPoint(irrelevant);
}

- (void)testCompareWithNSValue
{
    assertMatches(@"A point", equalToPoint(NSMakePoint(1, 2)), [NSValue valueWithPoint:NSMakePoint(1, 2)]);
}

- (void)testMismatchesDifferentPoint
{
    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(1, 2)), [NSValue valueWithPoint:NSMakePoint(1, 3)]);
    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(1, 2)), [NSValue valueWithPoint:NSMakePoint(2, 2)]);
    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(1, 2)), [NSValue valueWithPoint:NSMakePoint(2, 3)]);

    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(1, 2)), [NSValue valueWithSize:NSMakeSize(1, 2)]);
}

@end

@interface IsEqualToSizeTest : AbstractMatcherTest
@end

@implementation IsEqualToSizeTest

- (id <HCMatcher>)createMatcher {
    NSSize irrelevant = NSMakeSize(0, 0);
    return equalToSize(irrelevant);
}

- (void)testCompareWithNSValue {
    assertMatches(@"Same size", equalToSize(NSMakeSize(1, 2)), [NSValue valueWithSize:NSMakeSize(1, 2)]);

    assertMatches(@"Expecting the actual size is bigger", biggerThanSize(NSMakeSize(10, 20)), [NSValue valueWithSize:NSMakeSize(11, 20)]);
    assertMatches(@"Expecting the actual size is bigger", biggerThanSize(NSMakeSize(10, 20)), [NSValue valueWithSize:NSMakeSize(10, 21)]);

    assertMatches(@"Expecting the actual size is smaller", smallerThanSize(NSMakeSize(10, 20)), [NSValue valueWithSize:NSMakeSize(9, 20)]);
    assertMatches(@"Expecting the actual size is smaller", smallerThanSize(NSMakeSize(10, 20)), [NSValue valueWithSize:NSMakeSize(10, 19)]);
}

- (void)testMismatchesDifferentSize {
    assertDoesNotMatch(@"Different", equalToSize(NSMakeSize(1, 2)), [NSValue valueWithSize:NSMakeSize(1, 3)]);
    assertDoesNotMatch(@"Different", equalToSize(NSMakeSize(1, 2)), [NSValue valueWithSize:NSMakeSize(2, 2)]);
    assertDoesNotMatch(@"Different", equalToSize(NSMakeSize(1, 2)), [NSValue valueWithSize:NSMakeSize(2, 3)]);

    assertDoesNotMatch(@"Different", equalToSize(NSMakeSize(1, 2)), [NSValue valueWithPoint:NSMakePoint(1, 2)]);
}

@end

@interface IsEqualToRectTest : AbstractMatcherTest
@end

@implementation IsEqualToRectTest

- (id <HCMatcher>)createMatcher {
    NSRect irrelevant = NSMakeRect(0, 0, 0, 0);
    return equalToRect(irrelevant);
}

- (void)testCompareWithNSValue {
    assertMatches(@"A point", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(1, 2, 3, 4)]);
}

- (void)testMismatchesDifferentRect {
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(2, 2, 3, 4)]);
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(1, 3, 3, 4)]);
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(1, 2, 4, 4)]);
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(1, 2, 3, 5)]);
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithRect:NSMakeRect(7, 7, 7, 7)]);

    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(1, 2, 3, 4)), [NSValue valueWithSize:NSMakeSize(1, 2)]);
}

@end

@interface IsEqualToRangeTest : AbstractMatcherTest
@end

@implementation IsEqualToRangeTest

- (id <HCMatcher>)createMatcher {
    NSRange irrelevant = NSMakeRange(0, 0);
    return equalToRange(irrelevant);
}

- (void)testCompareWithNSValue {
    assertMatches(@"A point", equalToRange(NSMakeRange(1, 2)), [NSValue valueWithRange:NSMakeRange(1, 2)]);
}

- (void)testMismatchesDifferentRange {
    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(1, 2)), [NSValue valueWithRange:NSMakeRange(1, 3)]);
    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(1, 2)), [NSValue valueWithRange:NSMakeRange(2, 2)]);
    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(1, 2)), [NSValue valueWithRange:NSMakeRange(2, 3)]);

    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(1, 2)), [NSValue valueWithPoint:NSMakePoint(1, 2)]);
}

@end
