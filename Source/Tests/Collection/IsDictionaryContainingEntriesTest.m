//
//  OCHamcrest - IsDictionaryContainingEntriesTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContainingEntries.h>

    // Collaborators
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsDictionaryContainingEntriesTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingEntriesTest

- (id<HCMatcher>)createMatcher
{
    return hasEntries(@"irrelevant", @"irrelevant", nil);
}

- (void)testMatcherCreationRequiresEvenNumberOfArgs
{
    STAssertThrows(hasEntries(@"a", nil), @"Should require pairs of arguments");
}

- (void)testDoesNotMatchNonDictionary
{
    id object = [[[NSObject alloc] init] autorelease];
    assertDoesNotMatch(@"not dictionary", hasEntries(@"a", equalTo(@"1"), nil), object);
}

- (void)testMatchesDictionaryContainingSingleKeyWithMatchingValue
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1", @"a",
                          @"2", @"b",
                          nil];
    
    assertMatches(@"has a:1", hasEntries(@"a", equalTo(@"1"), nil), dict);
    assertMatches(@"has b:2", hasEntries(@"b", equalTo(@"2"), nil), dict);
    assertDoesNotMatch(@"no b:3", hasEntries(@"b", equalTo(@"3"), nil), dict);
    assertDoesNotMatch(@"no c:2", hasEntries(@"c", equalTo(@"2"), nil), dict);
}

- (void)testMatchesDictionaryContainingMultipleKeysWithMatchingValues
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1", @"a",
                          @"2", @"b",
                          @"3", @"c",
                          nil];
    
    assertMatches(@"has a & b", hasEntries(@"a", equalTo(@"1"), @"b", equalTo(@"2"), nil), dict);
    assertMatches(@"has c & a", hasEntries(@"c", equalTo(@"3"), @"a", equalTo(@"1"), nil), dict);
    assertDoesNotMatch(@"no d:3", hasEntries(@"d", equalTo(@"3"), nil), dict);
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1", @"a",
                          @"2", @"b",
                          @"3", @"c",
                          nil];
    
    assertMatches(@"has a & b", hasEntries(@"a", @"1", @"b", @"2", nil), dict);
    assertMatches(@"has c & a", hasEntries(@"c", @"3", @"a", @"1", nil), dict);
    assertDoesNotMatch(@"no d:3", hasEntries(@"d", @"3", nil), dict);
}

- (void)testShouldNotMatchNil
{
    assertDoesNotMatch(@"nil", hasEntries(@"a", @"1", nil), nil);
}

- (void)testMatcherCreationRequiresNonNilArguments
{    
    STAssertThrows(hasEntries(nil, @"value", nil), @"Should require non-nil argument");
    STAssertThrows(hasEntries(@"key", nil, nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    assertDescription(@"a dictionary containing { \"a\" = \"1\"; \"b\" = \"2\"; }",
                      hasEntries(@"a", @"1", @"b", @"2", nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", nil];
    assertNoMismatchDescription(hasEntries(@"a", @"1", nil), dict);
}

- (void)testMismatchDescriptionOfNonDictionaryShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasEntries(@"a", @"1", nil), @"bad");
}

- (void)testMismatchDescriptionOfDictionaryWithoutKey
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", @"3", @"c", nil];
    assertMismatchDescription(@"no \"b\" key in <{\n    a = 1;\n    c = 3;\n}>",
                              hasEntries(@"a", @"1", @"b", @"2", nil), dict);
}

- (void)testMismatchDescriptionOfDictionaryWithNonMatchingValue
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"a", nil];
    assertMismatchDescription(@"value for \"a\" was \"2\"", hasEntries(@"a", @"1", nil), dict);
}

- (void)testDescribeMismatchOfNonDictionaryShowsActualArgument
{
    assertDescribeMismatch(@"was \"bad\"", hasEntries(@"a", @"1", nil), @"bad");
}

- (void)testDescribeMismatchOfDictionaryWithoutKey
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", @"3", @"c", nil];
    assertDescribeMismatch(@"no \"b\" key in <{\n    a = 1;\n    c = 3;\n}>",
                           hasEntries(@"a", @"1", @"b", @"2", nil), dict);
}

- (void)testDescribeMismatchOfDictionaryWithNonMatchingValue
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"a", nil];
    assertDescribeMismatch(@"value for \"a\" was \"2\"", hasEntries(@"a", @"1", nil), dict);
}

@end
