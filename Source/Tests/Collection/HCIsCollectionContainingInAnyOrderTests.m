//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCollectionContainingInAnyOrder.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface ContainsInAnyOrderTests : MatcherTestCase
@end

@implementation ContainsInAnyOrderTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = containsInAnyOrder(equalTo(@"irrelevant"), nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testShouldNotMatchNonCollection
{
    id matcher = containsInAnyOrder(equalTo(@"irrelevant"), nil);

    assertDoesNotMatch(@"Non collection", matcher, [[NSObject alloc] init]);
}

- (void)testMatchingSingleItemCollection
{
    assertMatches(@"single item", (containsInAnyOrder(equalTo(@1), nil)), @[@1]);
}

- (void)testDoesNotMatchEmpty
{
    id matcher = containsInAnyOrder(equalTo(@1), equalTo(@2), nil);

    assertMismatchDescription(@"no item matches: <1>, <2> in []", matcher, @[]);
}

- (void)testMatchesCollectionOutOfOrder
{
    id matcher = containsInAnyOrder(equalTo(@1), equalTo(@2), nil);

    assertMatches(@"Out of order", matcher, (@[@2, @1]));
}

- (void)testMatchesCollectionInOfOrder
{
    id matcher = containsInAnyOrder(equalTo(@1), equalTo(@2), nil);

    assertMatches(@"In order", matcher, (@[@1, @2]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = containsInAnyOrder(@1, @2, nil);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@2, @1]));
}

- (void)testArrayVariant_ProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = containsInAnyOrderIn(@[@1, @2]);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@2, @1]));
}

- (void)testDoesNotMatchNil
{
    id matcher = containsInAnyOrder(@1, nil);

    assertMismatchDescription(@"was non-collection nil", matcher, nil);
}

- (void)testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    id matcher = containsInAnyOrder(@1, @2, @3, nil);

    assertMismatchDescription(@"not matched: <4>", matcher, (@[@1, @2, @4]));
}

- (void)testDoesNotMatchIfThereAreMoreElementsThanMatchers
{
    id matcher = containsInAnyOrder(@1, @3, nil);

    assertMismatchDescription(@"not matched: <2>", matcher, (@[@1, @2, @3]));
}

- (void)testDoesNotMatchIfThereAreMoreMatchersThanElements
{
    id matcher = containsInAnyOrder(@1, @2, @3, @4, nil);

    assertMismatchDescription(@"no item matches: <4> in [<1>, <2>, <3>]", matcher, (@[@1, @2, @3]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection over [<1>, <2>] in any order",
                      containsInAnyOrder(@1, @2, nil));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"not matched: <3>",
                           (containsInAnyOrder(@1, @2, nil)),
                           (@[@1, @3]));
}

@end
