//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCStringContainsInOrder.h>

#import "MatcherTestCase.h"


@interface StringContainsInOrderTests : MatcherTestCase
{
    id <HCMatcher> matcher;
}
@end

@implementation StringContainsInOrderTests

- (void)setUp
{
    [super setUp];
    matcher = stringContainsInOrder(@"string one", @"string two", @"string three", nil);
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (void)testCopesWithNilsAndUnknownTypes
{
    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testMatchesIfOrderIsCorrect
{
    assertMatches(@"correct order", matcher, @"string one then string two followed by string three");
}

- (void)testArrayVariant_MatchesIfOrderIsCorrect
{
    id <HCMatcher> variantMatcher = stringContainsInOrderIn(@[@"string one", @"string two", @"string three"]);

    assertMatches(@"correct order", variantMatcher, @"string one then string two followed by string three");
}

- (void)testDoesNotMatchIfOrderIsIncorrect
{
    assertDoesNotMatch(@"incorrect order", matcher, @"string two then string one followed by string three");
}

- (void)testDoesNotMatchIfExpectedSubstringsAreMissing
{
    assertDoesNotMatch(@"missing string one", matcher, @"string two then string three");
    assertDoesNotMatch(@"missing string two", matcher, @"string one then string three");
    assertDoesNotMatch(@"missing string three", matcher, @"string one then string two");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(stringContainsInOrder(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testMatcherCreationRequiresStringArguments
{
    XCTAssertThrows(stringContainsInOrder(@"one", @2, nil), @"Should require strings");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a string containing \"string one\", \"string two\", \"string three\" in order",
                      matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, @"string one then string two followed by string three");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", matcher, @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", matcher, @"bad");
}

@end
