//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsDictionaryContaining.h>

#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface HasEntryTests : MatcherTestCase
@end

@implementation HasEntryTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasEntry(@"irrelevant", @"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatchesDictionaryContainingMatchingKeyAndValue
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2};

    assertMatches(@"has a:1", hasEntry(equalTo(@"a"), equalTo(@1)), dict);
    assertMatches(@"has b:2", hasEntry(equalTo(@"b"), equalTo(@2)), dict);
    assertDoesNotMatch(@"no c:3", hasEntry(equalTo(@"c"), equalTo(@3)), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2};

    assertMatches(@"has a:1", hasEntry(@"a", equalTo(@1)), dict);
    assertMatches(@"has b:2", hasEntry(equalTo(@"b"), @2), dict);
    assertDoesNotMatch(@"no c:3", hasEntry(@"c", @3), dict);
}

- (void)testShouldNotMatchNil
{
    assertDoesNotMatch(@"nil", hasEntry(anything(), anything()), nil);
}

- (void)testMatcherCreationRequiresNonNilArguments
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(hasEntry(nil, @"value"), @"Should require non-nil argument");
    XCTAssertThrows(hasEntry(@"key", nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing { \"a\" = <1>; }", hasEntry(@"a", @1));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @1};
    assertNoMismatchDescription(hasEntry(@"a", @1), dict);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasEntry(@"a", @1), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasEntry(@"a", @1), @"bad");
}

@end
