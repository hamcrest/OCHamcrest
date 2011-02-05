//
//  OCHamcrest - IsDictionaryContainingValueTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContainingValue.h>

    // Other OCHamcrest
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
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    
    assertMatches(@"same single key", hasValue(equalTo(@"1")), dict);
}


- (void)testMatchesDictionaryContainingValue
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertMatches(@"Matches 1", hasValue(equalTo(@"1")), dict);
    assertMatches(@"Matches 3", hasValue(equalTo(@"3")), dict);
}


- (void)testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];

    assertMatches(@"Matches 3", hasValue(@"3"), dict);
}


- (void)testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"Empty dictionary", hasValue(@"Foo"), [NSDictionary dictionary]);
}


- (void)testDoesNotMatchDictionaryMissingValue
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertDoesNotMatch(@"no matching value", hasValue(@"4"), dict);
}


- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(hasValue(nil), @"Should require non-nil argument");
}


- (void)testHasReadableDescription
{
    assertDescription(@"dictionary containing value \"a\"", hasValue(@"a"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", nil];
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
