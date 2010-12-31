//
//  OCHamcrest - IsCollectionContainingInAnyOrderTest.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContainingInAnyOrder.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsCollectionContainingInAnyOrderTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingInAnyOrderTest

- (id<HCMatcher>) createMatcher
{
    return containsInAnyOrder(equalTo(@"irrelevant"), nil);
}


- (void) testMatchingSingleItemCollection
{
    assertMatches(@"Single item collection",
                  (containsInAnyOrder(equalTo(@"a"), nil)), ([NSArray arrayWithObjects:@"a", nil]));
}


- (void) testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"No item matches: \"a\", \"b\" in []",
                              (containsInAnyOrder(@"a", @"b", nil)), [NSArray array]);
}


- (void) testMatchesSequenceOutOfOrder
{
    assertMatches(@"Out of order",
                  (containsInAnyOrder(equalTo(@"a"), equalTo(@"b"), nil)),
                  ([NSArray arrayWithObjects:@"b", @"a", nil]));
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    assertMatches(@"Values automatically wrapped with equalTo",
                  (containsInAnyOrder(@"a", @"b", nil)),
                  ([NSArray arrayWithObjects:@"b", @"a", nil]));
}


- (void) testMatchesSequenceInOfOrder
{
    assertMatches(@"In order",
                  (containsInAnyOrder(equalTo(@"a"), equalTo(@"b"), nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", nil]));
}


- (void) testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    assertMismatchDescription(@"Not matched: \"d\"",
                              (containsInAnyOrder(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"d", nil]));
}


- (void) testDoesNotMatchWithMoreElementsThanExpected
{
    assertMismatchDescription(@"Not matched: \"b\"",
                              (containsInAnyOrder(@"a", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testDoesNotMatchWithFewerElementsThanExpected
{
    assertMismatchDescription(@"No item matches: \"d\" in [\"a\", \"b\", \"c\"]",
                              (containsInAnyOrder(@"a", @"b", @"c", @"d", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testDescribeMismatch
{
    assertDescribeMismatch(@"Not matched: \"c\"",
                           (containsInAnyOrder(@"a", @"b", nil)),
                           ([NSArray arrayWithObjects:@"a", @"c", nil]));
}

- (void) testHasAReadableDescription
{
    assertDescription(@"collection over [\"a\", \"b\"] in any order",
                      containsInAnyOrder(@"a", @"b", nil));
}


- (void) testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       containsInAnyOrder(@"a", nil), [[[NSObject alloc] init] autorelease]);
}

@end
