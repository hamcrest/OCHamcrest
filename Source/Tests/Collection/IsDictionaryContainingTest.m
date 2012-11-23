//
//  OCHamcrest - IsDictionaryContainingTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContaining.h>

    // Collaborators
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsDictionaryContainingTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingTest

- (id<HCMatcher>)createMatcher
{
    return hasEntry(@"irrelevant", @"irrelevant");
}

- (void)testMatchesDictionaryContainingMatchingKeyAndValue
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2"};

    assertMatches(@"has a:1", hasEntry(equalTo(@"a"), equalTo(@"1")), dict);
    assertMatches(@"has b:2", hasEntry(equalTo(@"b"), equalTo(@"2")), dict);
    assertDoesNotMatch(@"no c:3", hasEntry(equalTo(@"c"), equalTo(@"3")), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = @{@"a": @"1",
                                            @"b": @"2"};

    assertMatches(@"has a:1", hasEntry(@"a", equalTo(@"1")), dict);
    assertMatches(@"has b:2", hasEntry(equalTo(@"b"), @"2"), dict);
    assertDoesNotMatch(@"no c:3", hasEntry(@"c", @"3"), dict);
}

- (void)testShouldNotMatchNil
{
    assertDoesNotMatch(@"nil", hasEntry(anything(), anything()), nil);
}

- (void)testMatcherCreationRequiresNonNilArguments
{    
    STAssertThrows(hasEntry(nil, @"value"), @"Should require non-nil argument");
    STAssertThrows(hasEntry(@"key", nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing { \"a\" = \"1\"; }", hasEntry(@"a", @"1"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = @{@"a": @"1"};
    assertNoMismatchDescription(hasEntry(@"a", @"1"), dict);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasEntry(@"a", @"1"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasEntry(@"a", @"1"), @"bad");
}

@end
