//
//  OCHamcrest - IsEqualIgnoringCaseTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualIgnoringCase.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsEqualIgnoringCaseTest : AbstractMatcherTest
{
    id<HCMatcher> matcher;
}
@end


@implementation IsEqualIgnoringCaseTest

- (void)setUp
{
    matcher = [equalToIgnoringCase(@"heLLo") retain];
}


- (void)tearDown
{
    [matcher release];
}


- (id<HCMatcher>)createMatcher
{
    return matcher;
}


- (void)testIgnoresCaseOfCharsInString
{
    assertMatches(@"all upper", matcher, @"HELLO");
    assertMatches(@"all lower", matcher, @"hello");
    assertMatches(@"mixed up", matcher, @"HelLo");
    
    assertDoesNotMatch(@"no match", matcher, @"bye");
}


- (void)testFailsIfAdditionalWhitespaceIsPresent
{
    assertDoesNotMatch(@"whitespace suffix", matcher, @"heLLo ");
    assertDoesNotMatch(@"whitespace prefix", matcher, @" heLLo");
}


- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(equalToIgnoringCase(nil), @"Should require non-nil argument");
}


- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, [NSNumber numberWithInt:3]);
}


- (void)testHasAReadableDescription
{
    assertDescription(@"\"heLLo\" ignoring case", matcher);
}


- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, @"hello");
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
