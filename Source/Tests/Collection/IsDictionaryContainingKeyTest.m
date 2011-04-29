//
//  OCHamcrest - IsDictionaryContainingKeyTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
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
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    
    assertMatches(@"Matches single key", hasKey(equalTo(@"a")), dict);
}


- (void)testMatchesDictionaryContainingKey
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertMatches(@"Matches a", hasKey(equalTo(@"a")), dict);
    assertMatches(@"Matches c", hasKey(equalTo(@"c")), dict);
}


- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];

    assertMatches(@"Matches c", hasKey(@"c"), dict);
}


- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"empty", hasKey(@"Foo"), [NSDictionary dictionary]);
}


- (void)testDoesNotMatchDictionaryMissingKey
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
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
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", nil];
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
