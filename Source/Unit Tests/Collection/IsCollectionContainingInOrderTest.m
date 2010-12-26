//
//  OCHamcrest - IsCollectionContainingInOrderTest.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContainingInOrder.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsCollectionContainingInOrderTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingInOrderTest

- (id<HCMatcher>) createMatcher
{
    return contains(equalTo(@"irrelevant"), nil);
}


- (void) testMatchingSingleItemCollection
{
    assertMatches(@"Single item collection",
                  (contains(equalTo(@"a"), nil)), ([NSArray arrayWithObjects:@"a", nil]));
}


- (void) testMatchingMultipleItemSequence
{
    assertMatches(@"Multiple item sequence",
                  (contains(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    assertMatches(@"Values automatically wrapped with equalTo",
                  (contains(@"a", @"b", @"c", nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testDoesNotMatchWithMoreElementsThanExpected
{
    assertMismatchDescription(@"Not matched: \"d\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil]));
}


- (void) testDoesNotMatchWithFewerElementsThanExpected
{
    assertMismatchDescription(@"No item matched: \"c\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", nil]));
}


- (void) testDoesNotMatchIfSingleItemMismatches
{
    assertMismatchDescription(@"item 0: was \"c\"",
                              (contains(@"d", nil)), [NSArray arrayWithObject:@"c"]);
}


- (void) testDoesNotMatchIfOneOfMultipleItemsMismatch
{
    assertMismatchDescription(@"item 2: was \"d\"",
                              (contains(@"a", @"b", @"c", nil)),
                              ([NSArray arrayWithObjects:@"a", @"b", @"d", nil]));
}


- (void) testDoesNotMatchEmptyCollection
{
    assertMismatchDescription(@"No item matched: \"d\"", (contains(@"d", nil)), [NSArray array]);
}


- (void) testDescribeMismatch
{
    assertDescribeMismatch(@"item 1: was \"c\"",
                           (contains(@"a", @"b", nil)),
                           ([NSArray arrayWithObjects:@"a", @"c", nil]));
}

- (void) testHasAReadableDescription
{
    assertDescription(@"collection containing [\"a\", \"b\"]", contains(@"a", @"b", nil));
}


- (void) testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       contains(@"a", nil), [[[NSObject alloc] init] autorelease]);
}

@end
