//
//  OCHamcrest - StringContainsInOrderTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCStringContainsInOrder.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface StringContainsInOrderTest : AbstractMatcherTest
{
    id<HCMatcher> matcher;
}
@end

@implementation StringContainsInOrderTest

- (void)setUp
{
    [super setUp];
    matcher = [stringContainsInOrder(@"string one", @"string two", @"string three", nil) retain];
}

- (void)tearDown
{
    [matcher release];
    [super tearDown];
}

- (id<HCMatcher>)createMatcher
{
    return matcher;
}

- (void)testMatchesIfOrderIsCorrect
{
    assertMatches(@"correct order", matcher, @"string one then string two followed by string three");
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
    STAssertThrows(stringContainsInOrder(nil), @"Should require non-nil argument");
}

- (void)testMatcherCreationRequiresStringArguments
{    
    STAssertThrows(stringContainsInOrder(@"one", [NSNumber numberWithInt:2], nil), @"Should require strings");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, [NSNumber numberWithInt:3]);
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
