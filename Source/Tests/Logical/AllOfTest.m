//
//  OCHamcrest - AllOfTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAllOf.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface AllOfTest : AbstractMatcherTest
@end

@implementation AllOfTest

- (id<HCMatcher>)createMatcher
{
    return allOf(equalTo(@"irrelevant"), equalTo(@"irrelevant"), nil);
}

- (void)testMatchesIfArgumentSatisfiesBothOfTwoOtherMatchers
{
    assertMatches(@"both matchers", allOf(equalTo(@"good"), equalTo(@"good"), nil), @"good");
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"both matchers", allOf(@"good", @"good", nil), @"good");
}

- (void)testNoMatchIfArgumentFailsToSatisfyEitherOfTwoOtherMatchers
{
    assertDoesNotMatch(@"first matcher", allOf(equalTo(@"bad"), equalTo(@"good"), nil), @"good");
    assertDoesNotMatch(@"second matcher", allOf(equalTo(@"good"), equalTo(@"bad"), nil), @"good");
    assertDoesNotMatch(@"either matcher", allOf(equalTo(@"bad"), equalTo(@"bad"), nil), @"good");
}

- (void)testMatchesIfArgumentSatisfiesAllOfManyOtherMatchers
{
    assertMatches(@"all matchers",
                  allOf(equalTo(@"good"),
                        equalTo(@"good"),
                        equalTo(@"good"),
                        equalTo(@"good"),
                        equalTo(@"good"),
                        nil),
                  @"good");
}

- (void)testNoMatchIfArgumentFailsToSatisfyAllOfManyOtherMatchers
{
    assertDoesNotMatch(@"matcher in the middle",
                  allOf(equalTo(@"good"),
                        equalTo(@"good"),
                        equalTo(@"bad"),
                        equalTo(@"good"),
                        equalTo(@"good"),
                        nil),
                  @"good");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"(\"good\" and \"bad\" and \"ugly\")",
                      allOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(allOf(equalTo(@"good"), equalTo(@"good"), nil),
                                @"good");
}

- (void)testMismatchDescriptionDescribesFirstFailingMatch
{
    assertMismatchDescription(@"\"good\" was \"bad\"",
                              allOf(equalTo(@"bad"), equalTo(@"good"), nil),
                              @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"\"good\" was \"bad\"",
                           allOf(equalTo(@"bad"), equalTo(@"good"), nil),
                           @"bad");
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(allOf(nil), @"Should require non-nil list");
}

@end
