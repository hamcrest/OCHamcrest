//
//  OCHamcrest - IsCollectionContainingTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionContaining.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "Mismatchable.h"


@interface IsCollectionContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasItem(equalTo(@"irrelevant"));

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatchesACollectionThatContainsAnElementForTheGivenMatcher
{
    id matcher = hasItem(equalTo(@"a"));

    assertMatches(@"list containing 'a'", matcher, (@[@"a", @"b", @"c"]));
}

- (void)testDoesNotMatchCollectionWithoutAnElementForGivenMatcher
{
    id matcher = hasItem([Mismatchable mismatchable:@"a"]);

    assertMismatchDescription(@"mismatches were: [mismatched: b, mismatched: c]", matcher, (@[@"b", @"c"]));
    assertMismatchDescription(@"was empty", matcher, @[]);
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"doesn't match nil", hasItem(equalTo(@"a")), nil);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"list contains 'a'",
                  hasItem(@"a"), ([NSSet setWithObjects:@"a", @"b", @"c", nil]));
    assertDoesNotMatch(@"list without 'a'",
                       hasItem(@"a"), ([NSSet setWithObjects:@"b", @"c", nil]));
}

- (void)testDoesNotMatchNonCollection
{
    assertMismatchDescription(@"was non-collection nil", hasItem(equalTo(@"a")), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(hasItem(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing \"a\"", hasItem(@"a"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasItem(@"a"), ([NSSet setWithObjects:@"a", @"b", nil]));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was non-collection \"bad\"", hasItem(@"a"), @"bad");
}

- (void)testMatchesMultipleItemsInCollection
{
    id matcher1 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"list containing all items", matcher1, (@[@"a", @"b", @"c"]));

    id matcher2 = hasItems(@"a", @"b", @"c", nil);
    assertMatches(@"list containing all items (without matchers)", matcher2, (@[@"a", @"b", @"c"]));

    id matcher3 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"list containing all items in any order", matcher3, (@[@"c", @"b", @"a"]));

    id matcher4 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"list containing all items plus others", matcher4, (@[@"e", @"c", @"b", @"a", @"d"]));

    id matcher5 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertDoesNotMatch(@"not match list unless it contains all items", matcher5, (@[@"e", @"c", @"b", @"d"])); // 'a' missing
}

- (void)testReportsMismatchWithAReadableDescriptionForMultipleItems
{
    id matcher = hasItems(@3, @4, nil);

    assertMismatchDescription(@"a collection containing <4> mismatches were: [was <1>, was <2>, was <3>]",
            matcher, (@[@1, @2, @3]));
}

@end
