//
//  OCHamcrest - IsDictionaryContainingKeyTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContainingKey.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsDictionaryContainingKeyTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingKeyTest

- (id<HCMatcher>)createMatcher
{
    return hasKey(@"irrelevant");
}

- (void)testMatchesSingletonDictionaryContainingKey
{
    NSDictionary *dict = @{@"a": @"1"};
    
    assertMatches(@"Matches single key", hasKey(equalTo(@"a")), dict);
}

- (void)testMatchesDictionaryContainingKey
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};
    
    assertMatches(@"Matches a", hasKey(equalTo(@"a")), dict);
    assertMatches(@"Matches c", hasKey(equalTo(@"c")), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};

    assertMatches(@"Matches c", hasKey(@"c"), dict);
}

- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"empty", hasKey(@"Foo"), @{});
}

- (void)testDoesNotMatchDictionaryMissingKey
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};
    
    assertDoesNotMatch(@"no matching key", hasKey(@"d"), dict);
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(hasKey(nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing key \"a\"", hasKey(@"a"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @"1"};
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
