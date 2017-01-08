//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDescribedAs.h>

#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface DescribedAsTests : MatcherTestCase
@end

@implementation DescribedAsTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = describedAs(@"irrelevant", anything(), nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testOverridesDescriptionOfOtherMatcherWithThatPassedToInitializer
{
    id matcher = describedAs(@"my description", anything(), nil);

    assertDescription(@"my description", matcher);
}

- (void)testAppendsValuesToDescription
{
    id matcher = describedAs(@"value 1 = %0, value 2 = %1",
                            anything(),
                            @33,
                            @97,
                            nil);

    assertDescription(@"value 1 = <33>, value 2 = <97>", matcher);
}

- (void)testHandlesSubstitutionAtBeginning
{
    id matcher = describedAs(@"%0ok",
                            anything(),
                            @33,
                            nil);

    assertDescription(@"<33>ok", matcher);
}

- (void)testHandlesSubstitutionAtEnd
{
    id matcher = describedAs(@"ok%0",
                            anything(),
                            @33,
                            nil);

    assertDescription(@"ok<33>", matcher);
}

- (void)testDoesNotProcessPercentFollowedByNonDigit
{
    id matcher = describedAs(@"With 33% remaining", anything(), nil);

    assertDescription(@"With 33% remaining", matcher);
}

- (void)testDelegatesMatchingToNestedMatcher
{
    id matcher = describedAs(@"m1 description", equalTo(@"hi"), nil);

    assertMatches(@"should match", matcher, @"hi");
    assertDoesNotMatch(@"should not match", matcher, @"oi");
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(describedAs(@"irrelevant", anything(), nil), @"hi");
}

- (void)testDelegatesMismatchDescriptionToNestedMatcher
{
    id matcher = describedAs(@"irrelevant", equalTo(@2), nil);

    assertMismatchDescription(@"was <1>", matcher, @1);
}

- (void)testDelegatesDescribeMismatchToNestedMatcher
{
    id matcher = describedAs(@"irrelevant", equalTo(@2), nil);

    assertDescribeMismatch(@"was <1>", matcher, @1);
}

@end
