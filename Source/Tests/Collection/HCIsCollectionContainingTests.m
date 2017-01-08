//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCollectionContaining.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"
#import "Mismatchable.h"


@interface HasItemTests : MatcherTestCase
@end

@implementation HasItemTests

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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(hasItem(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
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

- (void)testHasItems_ProvidesConvenientShortcutForMatchingWIthEqualTo
{
    assertMatches(@"list containing all items", hasItems(@1, @2, @3, nil), (@[ @1, @2, @3 ]));
}

- (void)testArrayVariant_ProvidesConvenientShortcutForMatchingWIthEqualTo
{
    assertMatches(@"list containing all items", hasItemsIn(@[@1, @2, @3]), (@[ @1, @2, @3 ]));
}

- (void)testReportsMismatchWithAReadableDescriptionForMultipleItems
{
    id matcher = hasItems(@3, @4, nil);

    assertMismatchDescription(@"instead of a collection containing <4>, mismatches were: [was <1>, was <2>, was <3>]",
            matcher, (@[@1, @2, @3]));
}

@end
