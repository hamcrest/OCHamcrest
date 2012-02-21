//
//  OCHamcrest - IsCollectionContainingInOrderTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContainingInOrder.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsCollectionContainingInOrderTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingInOrderTest

- (id<HCMatcher>)createMatcher
{
    return contains(equalTo(@"irrelevant"), nil);
}

- (void)testMatchingSingleItemCollection
{
    assertMatches(@"Single item collection",
                  (contains(equalTo(@"a"), nil)), ([NSArray arrayWithObjects:@"a", nil]));
}

- (void)testMatchingMultipleItemSequence
{
    assertMatches(@"Multiple item sequence",
                  (contains(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equalTo",
                  (contains(@"a", @"b", @"c", nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}

- (void)testDoesNotMatchWithMoreElementsThanExpected
{
    assertMismatchDescription(@"not matched: \"d\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil]));
}

- (void)testDoesNotMatchWithFewerElementsThanExpected
{
    assertMismatchDescription(@"no item matched: \"c\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", nil]));
}

- (void)testDoesNotMatchIfSingleItemMismatches
{
    assertMismatchDescription(@"item 0: was \"c\"",
                              (contains(@"d", nil)), [NSArray arrayWithObject:@"c"]);
}

- (void)testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    assertMismatchDescription(@"item 2: was \"d\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"d", nil]));
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"Should not match nil", contains(@"a", nil), nil);
}

- (void)testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"no item matched: \"d\"", (contains(@"d", nil)), [NSArray array]);
}

- (void)testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       contains(@"a", nil), [[[NSObject alloc] init] autorelease]);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing [\"a\", \"b\"]", contains(@"a", @"b", nil));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"item 1: was \"c\"",
                           (contains(@"a", @"b", nil)),
                           ([NSArray arrayWithObjects:@"a", @"c", nil]));
}

- (void)testDescribeMismatchOfNonCollection
{
    assertDescribeMismatch(@"was nil", (contains(@"a", @"b", nil)), nil);
}

@end
