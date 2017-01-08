//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCollectionContainingInRelativeOrder.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface ContainsInRelativeOrderTests : MatcherTestCase
@end

@implementation ContainsInRelativeOrderTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = containsInRelativeOrder(@[equalTo(@"irrelevant")]);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testShouldNotMatchNonCollection
{
    id matcher = containsInRelativeOrder(@[equalTo(@"irrelevant")]);

    assertDoesNotMatch(@"Non collection", matcher, [[NSObject alloc] init]);
}

- (void)testMatchingSingleItemCollection
{
    id matcher = containsInRelativeOrder(@[equalTo(@1)]);

    assertMatches(@"Single item collection", matcher, @[@1]);
}

- (void)testMatchingMultipleItemCollection
{
    id matcher = containsInRelativeOrder(@[equalTo(@1), equalTo(@2), equalTo(@3)]);

    assertMatches(@"Multiple item sequence", matcher, (@[@1, @2, @3]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = containsInRelativeOrder(@[@1, @2, @3]);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@1, @2, @3]));
}

- (void)testMatchesWithMoreElementsThanExpectedAtBeginning
{
    id matcher = containsInRelativeOrder(@[@2, @3, @4]);

    assertMatches(@"More elements at beginning", matcher, (@[@1, @2, @3, @4]));
}

- (void)testMatchesWithMoreElementsThanExpectedAtEnd
{
    id matcher = containsInRelativeOrder(@[@1, @2, @3]);

    assertMatches(@"More elements at end", matcher, (@[@1, @2, @3, @4]));
}

- (void)testMatchesWithMoreElementsThanExpectedInBetween
{
    id matcher = containsInRelativeOrder(@[@1, @3]);

    assertMatches(@"More elements in between", matcher, (@[@1, @2, @3]));
}

- (void)testMatchesSubsection
{
    id matcher = containsInRelativeOrder(@[@2, @3]);

    assertMatches(@"Subsection of collection", matcher, (@[@1, @2, @3, @4]));
}

- (void)testMatchesWithSingleGapAndNotFirstOrLast
{
    id matcher = containsInRelativeOrder(@[@2, @4]);

    assertMatches(@"Subsection with single gaps without a first or last match", matcher, (@[@1, @2, @3, @4, @5]));
}

- (void)testMatchingSubsectionWithManyGaps
{
    id matcher = containsInRelativeOrder(@[@2, @4, @6]);

    assertMatches(@"Subsection with many gaps collection", matcher, (@[@1, @2, @3, @4, @5, @6, @7]));
}

- (void)testDoesNotMatchWithFewerElementsThanExpected
{
    id matcher = containsInRelativeOrder(@[@1, @2, @3]);

    assertMismatchDescription(@"<3> was not found after <2>", matcher, (@[@1, @2]));
}

- (void)testDoesNotMatchIfSingleItemNotFound
{
    id matcher = containsInRelativeOrder(@[@4]);

    assertMismatchDescription(@"<4> was not found", matcher, (@[@3]));
}

- (void)testDoesNotMatchIfOneOfMultipleItemsNotFound
{
    id matcher = containsInRelativeOrder(@[@1, @2, @3]);

    assertMismatchDescription(@"<3> was not found after <2>", matcher, (@[@1, @2, @4]));
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"Should not match nil", containsInRelativeOrder(@[@1]), nil);
}

- (void)testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"<4> was not found", containsInRelativeOrder(@[@4]), @[]);
}

- (void)testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       containsInRelativeOrder(@[@1]), [[NSObject alloc] init]);
}

- (void)testMatcherCreationRequiresNonEmptyArgument
{
    XCTAssertThrows(containsInRelativeOrder(@[]), @"Should require non-empty array");
}

- (void)testHasAReadableDescription
{
    id matcher = containsInRelativeOrder(@[@1, @2]);

    assertDescription(@"a collection containing [<1>, <2>] in relative order", matcher);
}

- (void)testDescribeMismatchOfNonCollection
{
    assertDescribeMismatch(@"was non-collection nil", (containsInRelativeOrder(@[@1])), nil);
}

@end
