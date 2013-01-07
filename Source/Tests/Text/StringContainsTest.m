//
//  OCHamcrest - StringContainsTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCStringContains.h>

    // Test support
#import "AbstractMatcherTest.h"

static NSString *EXCERPT = @"EXCERPT";


@interface StringContainsTest : AbstractMatcherTest
@end

@implementation StringContainsTest
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = containsString(EXCERPT);
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (id<HCMatcher>)createMatcher
{
    return matcher;
}

- (void)testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring
{
    assertMatches(@"excerpt at beginning", matcher, [EXCERPT stringByAppendingString:@"END"]);
    assertMatches(@"excerpt at end", matcher, [@"START" stringByAppendingString:EXCERPT]);
    assertMatches(@"excerpt in middle", matcher,
                  [[@"START" stringByAppendingString:EXCERPT] stringByAppendingString:@"END"]);
    assertMatches(@"excerpt repeated", matcher, [EXCERPT stringByAppendingString:EXCERPT]);
    
    assertDoesNotMatch(@"excerpt not in string", matcher, @"whatever");
    assertDoesNotMatch(@"only part of excerpt", matcher, [EXCERPT substringFromIndex:1]);
}

- (void)testEvaluatesToTrueIfArgumentIsEqualToSubstring
{
    assertMatches(@"excerpt is entire string", matcher, EXCERPT);
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(containsString(nil), @"Should require non-nil argument");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a string containing \"EXCERPT\"", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, EXCERPT);
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
