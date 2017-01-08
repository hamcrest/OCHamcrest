//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIs.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"
#import "NeverMatch.h"


@interface IsTests : MatcherTestCase
@end

@implementation IsTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = is(@"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testDelegatesMatchingToNestedMatcher
{
    assertMatches(@"should match", is(equalTo(@"A")), @"A");
    assertMatches(@"should match", is(equalTo(@"B")), @"B");
    assertDoesNotMatch(@"should not match", is(equalTo(@"A")), @"B");
    assertDoesNotMatch(@"should not match", is(equalTo(@"B")), @"A");
}

- (void)testDescriptionShouldPassThrough
{
    assertDescription(@"\"A\"", is(equalTo(@"A")));
}

- (void)testProvidesConvenientShortcutForIsEqualTo
{
    assertMatches(@"should match", is(@"A"), @"A");
    assertMatches(@"should match", is(@"B"), @"B");
    assertDoesNotMatch(@"should not match", is(@"A"), @"B");
    assertDoesNotMatch(@"should not match", is(@"B"), @"A");
    assertDescription(@"\"A\"", is(@"A"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(is(@"A"), @"A");
}

- (void)testDelegatesMismatchDescriptionToNestedMatcher
{
    assertMismatchDescription([NeverMatch mismatchDescription],
                              is([NeverMatch neverMatch]),
                              @"hi");
}

- (void)testDelegatesDescribeMismatchToNestedMatcher
{
    assertDescribeMismatch([NeverMatch mismatchDescription],
                           is([NeverMatch neverMatch]),
                           @"hi");
}

@end
