//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsDictionaryContainingKey.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface HasKeyTests : MatcherTestCase
@end

@implementation HasKeyTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasKey(@"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatchesSingletonDictionaryContainingKey
{
    NSDictionary *dict = @{@"a": @1};

    assertMatches(@"Matches single key", hasKey(equalTo(@"a")), dict);
}

- (void)testMatchesDictionaryContainingKey
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"Matches a", hasKey(equalTo(@"a")), dict);
    assertMatches(@"Matches c", hasKey(equalTo(@"c")), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"Matches c", hasKey(@"c"), dict);
}

- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"empty", hasKey(@"Foo"), @{});
}

- (void)testDoesNotMatchDictionaryMissingKey
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertDoesNotMatch(@"no matching key", hasKey(@"d"), dict);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(hasKey(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing key \"a\"", hasKey(@"a"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @1};
    assertNoMismatchDescription(hasKey(@"a"), dict);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasKey(@"a"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasKey(@"a"), @"bad");
}

@end
