//
//  OCHamcrest - IsCollectionContainingTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContaining.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsCollectionContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingTest

- (id<HCMatcher>) createMatcher
{
    return hasItem(equalTo(@"irrelevant"));
}


- (void) testMatchesACollectionThatContainsAnElementMatchingTheGivenMatcher
{
    assertMatches(@"should match list that contains 'a'",
                  hasItem(equalTo(@"a")), ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testDoesNotMatchCollectionThatDoesntContainAnElementMatchingTheGivenMatcher
{
    assertDoesNotMatch(@"should not match list that doesn't contain 'a'",
                       hasItem(equalTo(@"a")), ([NSArray arrayWithObjects:@"b", @"c", nil]));    
    assertDoesNotMatch(@"should not match the empty list",
                       hasItem(equalTo(@"a")), [NSArray array]);
}


- (void) testDoesNotMatchNil
{
    assertDoesNotMatch(@"should not match nil", hasItem(equalTo(@"a")), nil);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    assertMatches(@"should match container that contains 'a'",
                  hasItem(@"a"), ([NSSet setWithObjects:@"a", @"b", @"c", nil]));
    assertDoesNotMatch(@"should not match container that doesn't contain 'a'",
                       hasItem(@"a"), ([NSSet setWithObjects:@"b", @"c", nil]));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a collection containing \"a\"", hasItem(equalTo(@"a")));
}


- (void) testMatchesAllItemsInCollection
{
    assertMatches(@"should match list containing all items",
                  (hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
    
    assertMatches(@"should match list containing all items (without matchers)",
                  (hasItems(@"a", @"b", @"c", nil)),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
    
    assertMatches(@"should match list containing all items in any order",
                  (hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                  ([NSArray arrayWithObjects:@"c", @"b", @"a", nil]));
    
    assertMatches(@"should match list containing all items plus others",
                  (hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                  ([NSArray arrayWithObjects:@"e", @"c", @"b", @"a", @"d", nil]));
    
    assertDoesNotMatch(@"should not match list unless it contains all items",
                       (hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil)),
                       ([NSArray arrayWithObjects:@"e", @"c", @"b", @"d", nil]));  // "a" missing
}


- (void) testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                       hasItem(@"a"), [[[NSObject alloc] init] autorelease]);
}


- (void) testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(hasItem(nil), @"Should require non-nil argument");
    STAssertThrows(hasItems(nil), @"Should require non-nil list");
}

@end
