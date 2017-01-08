//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCollectionContainingInOrder.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface ContainsTests : MatcherTestCase
@end

@implementation ContainsTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = contains(equalTo(@"irrelevant"), nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testShouldNotMatchNonCollection
{
    id matcher = contains(equalTo(@"irrelevant"), nil);

    assertDoesNotMatch(@"Non collection", matcher, [[NSObject alloc] init]);
}

- (void)testMatchingSingleItemCollection
{
    id matcher = contains(equalTo(@1), nil);

    assertMatches(@"Single item collection", matcher, @[@1]);
}

- (void)testMatchingMultipleItemCollection
{
    id matcher = contains(equalTo(@1), equalTo(@2), equalTo(@3), nil);

    assertMatches(@"Multiple item sequence", matcher, (@[@1, @2, @3]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = contains(@1, @2, @3, nil);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@1, @2, @3]));
}

- (void)testArrayVariant_ProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = containsIn(@[@1, @2, @3]);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@1, @2, @3]));
}

- (void)testDoesNotMatchWithMoreElementsThanExpected
{
    id matcher = contains(@1, @2, @3, nil);

    assertMismatchDescription(@"exceeded count of 3 with item <999>", matcher, (@[@1, @2, @3, @999]));
}

- (void)testDoesNotMatchWithFewerElementsThanExpected
{
    id matcher = contains(@1, @2, @3, nil);

    assertMismatchDescription(@"no item was <3>", matcher, (@[@1, @2]));
}

- (void)testDoesNotMatchIfSingleItemMismatches
{
    id matcher = contains(@4, nil);

    assertMismatchDescription(@"item 0: was <3>", matcher, @[@3]);
}

- (void)testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    id matcher = contains(@1, @2, @3, nil);

    assertMismatchDescription(@"item 2: was <4>", matcher, (@[@1, @2, @4]));
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"Should not match nil", contains(@1, nil), nil);
}

- (void)testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"no item was <4>", (contains(@4, nil)), @[]);
}

- (void)testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       contains(@1, nil), [[NSObject alloc] init]);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing [<1>, <2>]", contains(@1, @2, nil));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"item 1: was <3>",
                           (contains(@1, @2, nil)),
                           (@[@1, @3]));
}

- (void)testDescribeMismatchOfNonCollection
{
    assertDescribeMismatch(@"was non-collection nil", (contains(@1, @2, nil)), nil);
}

@end
