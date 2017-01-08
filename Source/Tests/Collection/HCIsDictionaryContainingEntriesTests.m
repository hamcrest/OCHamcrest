//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsDictionaryContainingEntries.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface HasEntriesTests : MatcherTestCase
@end

@implementation HasEntriesTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasEntries(@"irrelevant", @"irrelevant", nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatcherCreationRequiresEvenNumberOfArgs
{
    XCTAssertThrows(hasEntries(@"a", nil), @"Should require pairs of arguments");
}

- (void)testDoesNotMatchNonDictionary
{
    id object = [[NSObject alloc] init];
    assertDoesNotMatch(@"not dictionary", hasEntries(@"a", equalTo(@1), nil), object);
}

- (void)testMatchesDictionaryContainingSingleKeyWithMatchingValue
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2};

    assertMatches(@"has a:1", hasEntries(@"a", equalTo(@1), nil), dict);
    assertMatches(@"has b:2", hasEntries(@"b", equalTo(@2), nil), dict);
    assertDoesNotMatch(@"no b:3", hasEntries(@"b", equalTo(@3), nil), dict);
    assertDoesNotMatch(@"no c:2", hasEntries(@"c", equalTo(@2), nil), dict);
}

- (void)testMatchesDictionaryContainingMultipleKeysWithMatchingValues
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"has a & b", hasEntries(@"a", equalTo(@1), @"b", equalTo(@2), nil), dict);
    assertMatches(@"has c & a", hasEntries(@"c", equalTo(@3), @"a", equalTo(@1), nil), dict);
    assertDoesNotMatch(@"no d:3", hasEntries(@"d", equalTo(@3), nil), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @1,
                           @"b": @2,
                           @"c": @3};

    assertMatches(@"has a & b", hasEntries(@"a", @1, @"b", @2, nil), dict);
    assertMatches(@"has c & a", hasEntries(@"c", @3, @"a", @1, nil), dict);
    assertDoesNotMatch(@"no d:3", hasEntries(@"d", @3, nil), dict);
}

- (void)testDictionaryVariant_ProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @1,
            @"b": @2,
            @"c": @3};

    assertMatches(@"has a & b", hasEntriesIn(@{@"a": @1, @"b": @2}), dict);
    assertMatches(@"has c & a", hasEntriesIn(@{@"c": @3, @"a": @1}), dict);
    assertDoesNotMatch(@"no d:3", hasEntriesIn(@{@"d": @3}), dict);
}

- (void)testShouldNotMatchNil
{
    assertDoesNotMatch(@"nil", hasEntries(@"a", @1, nil), nil);
}

- (void)testMatcherCreationRequiresNonNilArguments
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(hasEntries(nil, @"value", nil), @"Should require non-nil argument");
    XCTAssertThrows(hasEntries(@"key", nil, nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing { \"a\" = <1>; \"b\" = <2>; }",
                      hasEntries(@"a", @1, @"b", @2, nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @1};
    assertNoMismatchDescription(hasEntries(@"a", @1, nil), dict);
}

- (void)testMismatchDescriptionOfNonDictionaryShowsActualArgument
{
    assertMismatchDescription(@"was non-dictionary \"bad\"", hasEntries(@"a", @1, nil), @"bad");
}

- (void)testMismatchDescriptionOfDictionaryWithoutKey
{
    NSDictionary *dict = @{@"a": @1, @"c": @3};
    assertMismatchDescription(@"no \"b\" key in <{\n    a = 1;\n    c = 3;\n}>",
                              hasEntries(@"a", @1, @"b", @2, nil), dict);
}

- (void)testMismatchDescriptionOfDictionaryWithNonMatchingValue
{
    NSDictionary *dict = @{@"a": @2};
    assertMismatchDescription(@"value for \"a\" was <2>", hasEntries(@"a", @1, nil), dict);
}

- (void)testDescribeMismatchOfNonDictionaryShowsActualArgument
{
    assertDescribeMismatch(@"was non-dictionary \"bad\"", hasEntries(@"a", @1, nil), @"bad");
}

- (void)testDescribeMismatchOfDictionaryWithoutKey
{
    NSDictionary *dict = @{@"a": @1, @"c": @3};
    assertDescribeMismatch(@"no \"b\" key in <{\n    a = 1;\n    c = 3;\n}>",
                           hasEntries(@"a", @1, @"b", @2, nil), dict);
}

- (void)testDescribeMismatchOfDictionaryWithNonMatchingValue
{
    NSDictionary *dict = @{@"a": @2};
    assertDescribeMismatch(@"value for \"a\" was <2>", hasEntries(@"a", @1, nil), dict);
}

@end
