//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

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
    id matcher = hasItem(equalTo(@1));

    assertMatches(@"list containing 1", matcher, (@[@1, @2, @3]));
}

- (void)testDoesNotMatchCollectionWithoutAnElementForGivenMatcher
{
    id matcher = hasItem([Mismatchable mismatchable:@"a"]);

    assertMismatchDescription(@"mismatches were: [mismatched: b, mismatched: c]", matcher, (@[@"b", @"c"]));
    assertMismatchDescription(@"was empty", matcher, @[]);
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"doesn't match nil", hasItem(equalTo(@1)), nil);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"list contains '1'", hasItem(@1), ([NSSet setWithObjects:@1, @2, @3, nil]));
    assertDoesNotMatch(@"list without '1'", hasItem(@1), ([NSSet setWithObjects:@2, @3, nil]));
}

- (void)testDoesNotMatchNonCollection
{
    assertMismatchDescription(@"was non-collection nil", hasItem(equalTo(@1)), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(hasItem(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing <1>", hasItem(@1));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasItem(@1), ([NSSet setWithObjects:@1, @2, nil]));
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was non-collection \"bad\"", hasItem(@1), @"bad");
}

- (void)testMatchesMultipleItemsInCollection
{
    id matcher1 = hasItems(equalTo(@1), equalTo(@2), equalTo(@3), nil);
    assertMatches(@"list containing all items", matcher1, (@[@1, @2, @3]));

    id matcher2 = hasItems(@1, @2, @3, nil);
    assertMatches(@"list containing all items (without matchers)", matcher2, (@[@1, @2, @3]));

    id matcher3 = hasItems(equalTo(@1), equalTo(@2), equalTo(@3), nil);
    assertMatches(@"list containing all items in any order", matcher3, (@[@3, @2, @1]));

    id matcher4 = hasItems(equalTo(@1), equalTo(@2), equalTo(@3), nil);
    assertMatches(@"list containing all items plus others", matcher4, (@[@5, @3, @2, @1, @4]));

    id matcher5 = hasItems(equalTo(@1), equalTo(@2), equalTo(@3), nil);
    assertDoesNotMatch(@"not match list unless it contains all items", matcher5, (@[@5, @3, @2, @4])); // '1' missing
}

- (void)testReportsMismatchWithAReadableDescriptionForMultipleItems
{
    id matcher = hasItems(@3, @4, nil);

    assertMismatchDescription(@"a collection containing <4> mismatches were: [was <1>, was <2>, was <3>]",
            matcher, (@[@1, @2, @3]));
}

@end
