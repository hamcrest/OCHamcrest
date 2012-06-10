//
//  OCHamcrest - AnyOfTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAnyOf.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface AnyOfTest : AbstractMatcherTest
@end

@implementation AnyOfTest

- (id<HCMatcher>)createMatcher
{
    return anyOf(equalTo(@"irrelevant"), nil);
}

- (void)testMatchesIfArgumentSatisfiesEitherOrBothOfTwoOtherMatchers
{
    assertMatches(@"first matcher", anyOf(equalTo(@"good"), equalTo(@"bad"), nil), @"good");
    assertMatches(@"second matcher", anyOf(equalTo(@"bad"), equalTo(@"good"), nil), @"good");
    assertMatches(@"both matchers", anyOf(equalTo(@"good"), equalTo(@"good"), nil), @"good");
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"first matcher", anyOf(@"good", @"bad", nil), @"good");
    assertMatches(@"second matcher", anyOf(@"bad", @"good", nil), @"good");
    assertMatches(@"both matchers", anyOf(@"good", @"good", nil), @"good");
}

- (void)testNoMatchIfArgumentFailsToSatisfyEitherOfTwoOtherMatchers
{
    assertDoesNotMatch(@"first matcher", anyOf(equalTo(@"bad"), equalTo(@"bad"), nil), @"good");
}

- (void)testMatchesIfArgumentSatisfiesAnyOfManyOtherMatchers
{
    assertMatches(@"matcher in the middle",
                  anyOf(equalTo(@"bad"),
                        equalTo(@"bad"),
                        equalTo(@"good"),
                        equalTo(@"bad"),
                        equalTo(@"bad"),
                        nil),
                  @"good");
}

- (void)testNoMatchIfArgumentFailsToSatisfyAnyOfManyOtherMatchers
{
    assertDoesNotMatch(@"all matchers",
                       anyOf(equalTo(@"bad"),
                             equalTo(@"bad"),
                             equalTo(@"bad"),
                             equalTo(@"bad"),
                             equalTo(@"bad"),
                             nil),
                       @"good");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"(\"good\" or \"bad\" or \"ugly\")",
                      anyOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(anyOf(equalTo(@"good"), equalTo(@"good"), nil),
                                @"good");
}

- (void)testMismatchDescriptionDescribesFirstFailingMatch
{
    assertMismatchDescription(@"was \"ugly\"",
                              anyOf(equalTo(@"bad"), equalTo(@"good"), nil),
                              @"ugly");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"ugly\"",
                           anyOf(equalTo(@"bad"), equalTo(@"good"), nil),
                           @"ugly");
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(anyOf(nil), @"Should require non-nil list");
}

@end
