//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCloseTo.h>

#import "MatcherTestCase.h"


@interface CloseToTests : MatcherTestCase
@end

@implementation CloseToTests

- (void)testCopesWithNilsAndUnknownTypes
{
    double irrelevant = 0.1;
    id matcher = closeTo(irrelevant, irrelevant);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testEvaluatesToTrueIfArgumentIsEqualToADoubleValueWithinSomeError
{
    id matcher = closeTo(1.0, 0.5);

    assertMatches(@"equal", matcher, @1.0);
    assertMatches(@"less but within delta", matcher, @0.5);
    assertMatches(@"greater but within delta", matcher, @1.5);

    assertDoesNotMatch(@"too small", matcher, @0.4);
    assertDoesNotMatch(@"too big", matcher, @1.6);
}

- (void)testFailsIfMatchingAgainstNonNumber
{
    id matcher = closeTo(1.0, 0.5);

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
