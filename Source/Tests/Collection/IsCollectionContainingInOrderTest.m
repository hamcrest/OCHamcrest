//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContainingInOrder.h>

#import <OCHamcrest/HCIsEqual.h>

#import "AbstractMatcherTest.h"


@interface IsCollectionContainingInOrderTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingInOrderTest

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

- (void)testMatchingMultipleItemSequence
{
    id matcher = contains(equalTo(@1), equalTo(@2), equalTo(@3), nil);

    assertMatches(@"Multiple item sequence", matcher, (@[@1, @2, @3]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    id matcher = contains(@1, @2, @3, nil);

    assertMatches(@"Values automatically wrapped with equalTo", matcher, (@[@1, @2, @3]));
}

- (void)testDoesNotMatchWithMoreElementsThanExpected
{
    id matcher = contains(@1, @2, @3, nil);

    assertMismatchDescription(@"not matched: <4>", matcher, (@[@1, @2, @3, @4]));
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
