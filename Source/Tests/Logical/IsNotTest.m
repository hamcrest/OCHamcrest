//
//  OCHamcrest - IsNotTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsNot.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsNotTest : AbstractMatcherTest
@end

@implementation IsNotTest

- (id<HCMatcher>)createMatcher
{
    return isNot(@"something");
}

- (void)testEvaluatesToTheTheLogicalNegationOfAnotherMatcher
{
    assertMatches(@"invert mismatch", isNot(equalTo(@"A")), @"B");
    assertDoesNotMatch(@"invert match", isNot(equalTo(@"A")), @"A");
}

- (void)testProvidesConvenientShortcutForNotEqualTo
{
    assertMatches(@"invert mismatch", isNot(@"A"), @"B");
    assertDoesNotMatch(@"invert match", isNot(@"A"), @"A");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"not \"A\"", isNot(@"A"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(isNot(@"A"), @"B");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"A\"", isNot(@"A"), @"A");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"A\"", isNot(@"A"), @"A");
}

@end
