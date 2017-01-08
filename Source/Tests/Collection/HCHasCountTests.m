//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCHasCount.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCOrderingComparison.h>

#import "MatcherTestCase.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface HasCountTests : MatcherTestCase
@end

@implementation HasCountTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasCount(equalTo(@42));

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testConvertsCountToNSNumberAndPassesToNestedMatcher
{
    FakeWithCount *fakeWithCount = [FakeWithCount fakeWithCount:5];

    assertMatches(@"same number", hasCount(equalTo(@5)), fakeWithCount);
    assertDoesNotMatch(@"different number", hasCount(equalTo(@6)), fakeWithCount);
}

- (void)testHasReadableDescription
{
    assertDescription(@"a collection with count of a value greater than <5>",
                      hasCount(greaterThan(@(5))));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasCountOf(2), ([NSSet setWithObjects:@1, @2, nil]));
}

- (void)testMismatchDescriptionForItemWithWrongCount
{
    assertMismatchDescription(@"was count of <42> with <FakeWithCount>",
                              hasCount(equalTo(@1)), [FakeWithCount fakeWithCount:42]);
}

- (void)testMismatchDescriptionForItemWithoutCount
{
    assertMismatchDescription(@"was <FakeWithoutCount>",
                              hasCount(equalTo(@1)), [FakeWithoutCount fake]);
}

- (void)testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was count of <42> with <FakeWithCount>",
                           hasCount(equalTo(@1)), [FakeWithCount fakeWithCount:42]);
}

- (void)testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <FakeWithoutCount>",
                           hasCount(equalTo(@1)), [FakeWithoutCount fake]);
}

@end


@interface HasCountOfTests : MatcherTestCase
@end

@implementation HasCountOfTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasCountOf(42);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testHasCountOfIsShortcutForEqualToUnsignedInteger
{
    FakeWithCount *fakeWithCount = [FakeWithCount fakeWithCount:5];

    assertMatches(@"same number", hasCountOf(5), fakeWithCount);
    assertDoesNotMatch(@"different number", hasCountOf(6), fakeWithCount);
}

- (void)testHasReadableDescription
{
    assertDescription(@"a collection with count of <5>", hasCountOf(5));
}

- (void)testMismatchDescriptionForItemWithWrongCount
{
    assertMismatchDescription(@"was count of <42> with <FakeWithCount>",
                              hasCountOf(1), [FakeWithCount fakeWithCount:42]);
}

- (void)testMismatchDescriptionForItemWithoutCount
{
    assertMismatchDescription(@"was <FakeWithoutCount>", hasCountOf(1), [FakeWithoutCount fake]);
}

- (void)testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was count of <42> with <FakeWithCount>",
                           hasCountOf(1), [FakeWithCount fakeWithCount:42]);
}

- (void)testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <FakeWithoutCount>", hasCountOf(1), [FakeWithoutCount fake]);
}

@end
