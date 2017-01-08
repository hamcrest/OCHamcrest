//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsDictionaryContainingValue.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface HasValueTests : MatcherTestCase
@end

@implementation HasValueTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasValue(@"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatchesSingletonDictionaryContainingValue
{
    NSDictionary *dict = @{@"a": @1};

    assertMatches(@"same single value", hasValue(equalTo(@1)), dict);
}

- (void)testMatchesDictionaryContainingValue
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"Matches 1", hasValue(equalTo(@1)), dict);
    assertMatches(@"Matches 3", hasValue(equalTo(@3)), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"Matches 3", hasValue(@3), dict);
}

- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"Empty dictionary", hasValue(@"Foo"), @{});
}

- (void)testDoesNotMatchDictionaryMissingValue
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertDoesNotMatch(@"no matching value", hasValue(@4), dict);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(hasValue(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing value <1>", hasValue(@1));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @1};
    assertNoMismatchDescription(hasValue(@1), dict);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasValue(@1), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasValue(@1), @"bad");
}

@end
