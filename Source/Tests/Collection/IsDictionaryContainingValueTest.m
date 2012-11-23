//
//  OCHamcrest - IsDictionaryContainingValueTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContainingValue.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsDictionaryContainingValueTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingValueTest

- (id<HCMatcher>)createMatcher
{
    return hasValue(@"irrelevant");
}

- (void)testMatchesSingletonDictionaryContainingValue
{
    NSDictionary *dict = @{@"a": @"1"};
    
    assertMatches(@"same single key", hasValue(equalTo(@"1")), dict);
}

- (void)testMatchesDictionaryContainingValue
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};
    
    assertMatches(@"Matches 1", hasValue(equalTo(@"1")), dict);
    assertMatches(@"Matches 3", hasValue(equalTo(@"3")), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};

    assertMatches(@"Matches 3", hasValue(@"3"), dict);
}

- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"Empty dictionary", hasValue(@"Foo"), @{});
}

- (void)testDoesNotMatchDictionaryMissingValue
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2",
                                            @"c": @"3"};
    
    assertDoesNotMatch(@"no matching value", hasValue(@"4"), dict);
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(hasValue(nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing value \"a\"", hasValue(@"a"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @"1"};
    assertNoMismatchDescription(hasValue(@"1"), dict);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasValue(@"1"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasValue(@"1"), @"bad");
}

@end
