//
//  OCHamcrest - IsCloseToTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCloseTo.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsCloseToTest : AbstractMatcherTest
@end

@implementation IsCloseToTest

- (id<HCMatcher>)createMatcher
{
    double irrelevant = 0.1;
    return closeTo(irrelevant, irrelevant);
}

- (void)testEvaluatesToTrueIfArgumentIsEqualToADoubleValueWithinSomeError
{
    id<HCMatcher> matcher = closeTo(1.0, 0.5);

    assertMatches(@"equal", matcher, @1.0);
    assertMatches(@"less but within delta", matcher, @0.5);
    assertMatches(@"greater but within delta", matcher, @1.5);

    assertDoesNotMatch(@"too small", matcher, @0.4);
    assertDoesNotMatch(@"too big", matcher, @1.6);
}

- (void)testFailsIfMatchingAgainstNonNumber
{
    id<HCMatcher> matcher = closeTo(1.0, 0.5);

    assertDoesNotMatch(@"not a number", matcher, @"a");
    assertDoesNotMatch(@"not a number", matcher, nil);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a numeric value within <0.5> of <1>", closeTo(1.0, 0.5));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(closeTo(1.0, 0.5), (@1.0));
}

- (void)testMismatchDescriptionShowsActualDeltaIfArgumentIsNumeric
{
    assertMismatchDescription(@"<1.7> differed by <0.7>",
                              (closeTo(1.0, 0.5)), @1.7);
}

- (void)testMismatchDescriptionShowsActualArgumentIfNotNumeric
{
    assertMismatchDescription(@"was \"bad\"", (closeTo(1.0, 0.5)), @"bad");
}

- (void)testDescribeMismatchShowsActualDeltaIfArgumentIsNumeric
{
    assertDescribeMismatch(@"<1.7> differed by <0.7>",
                           (closeTo(1.0, 0.5)), @1.7);
}

- (void)testDescribeMismatchShowsActualArgumentIfNotNumeric
{
    assertDescribeMismatch(@"was \"bad\"", (closeTo(1.0, 0.5)), @"bad");
}

@end
