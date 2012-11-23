//
//  OCHamcrest - IsCollectionContainingInAnyOrderTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContainingInAnyOrder.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsCollectionContainingInAnyOrderTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingInAnyOrderTest

- (id<HCMatcher>)createMatcher
{
    return containsInAnyOrder(equalTo(@"irrelevant"), nil);
}

- (void)testMatchingSingleItemCollection
{
    assertMatches(@"Single item collection",
                  (containsInAnyOrder(equalTo(@"a"), nil)), ([NSArray arrayWithObjects:@"a", nil]));
}

- (void)testMatchesCollectionInOfOrder
{
    assertMatches(@"In order",
                  (containsInAnyOrder(equalTo(@"a"), equalTo(@"b"), nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", nil]));
}

- (void)testMatchesCollectionOutOfOrder
{
    assertMatches(@"Out of order",
                  (containsInAnyOrder(equalTo(@"a"), equalTo(@"b"), nil)),
                  ([NSArray arrayWithObjects:@"b", @"a", nil]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equalTo",
                  (containsInAnyOrder(@"a", @"b", nil)),
                  ([NSArray arrayWithObjects:@"b", @"a", nil]));
}

- (void)testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"no item matches: \"a\", \"b\" in []",
                              (containsInAnyOrder(@"a", @"b", nil)), @[]);
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"Should not match nil", containsInAnyOrder(@"a", nil), nil);
}

- (void)testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    assertMismatchDescription(@"not matched: \"d\"",
                              (containsInAnyOrder(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"d", nil]));
}

- (void)testDoesNotMatchWithMoreElementsThanExpected
{
    assertMismatchDescription(@"not matched: \"b\"",
                              (containsInAnyOrder(@"a", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}

- (void)testDoesNotMatchWithFewerElementsThanExpected
{
    assertMismatchDescription(@"no item matches: \"d\" in [\"a\", \"b\", \"c\"]",
                              (containsInAnyOrder(@"a", @"b", @"c", @"d", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}

- (void)testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"no enumerator",
                       containsInAnyOrder(@"a", nil), [[NSObject alloc] init]);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection over [\"a\", \"b\"] in any order",
                      containsInAnyOrder(@"a", @"b", nil));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"not matched: \"c\"",
                           (containsInAnyOrder(@"a", @"b", nil)),
                           ([NSArray arrayWithObjects:@"a", @"c", nil]));
}

- (void)testDescribeMismatchOfNonCollection
{
    assertDescribeMismatch(@"was nil", (containsInAnyOrder(@"a", @"b", nil)), nil);
}

@end
