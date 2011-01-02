//
//  OCHamcrest - IsEqualIgnoringCaseTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualIgnoringCase.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


@interface IsEqualIgnoringCaseTest : AbstractMatcherTest
@end

@implementation IsEqualIgnoringCaseTest

- (id<HCMatcher>) createMatcher
{
    return equalToIgnoringCase(@"irrelevant");
}


- (void) testIgnoresCaseOfCharsInString
{
    assertThat(@"HELLO", equalToIgnoringCase(@"heLLo"));
    assertThat(@"hello", equalToIgnoringCase(@"heLLo"));
    assertThat(@"HelLo", equalToIgnoringCase(@"heLLo"));

    assertThat(@"bye", isNot(equalToIgnoringCase(@"heLLo")));
}


- (void) testFailsIfAdditionalWhitespaceIsPresent
{
    assertThat(@"heLLo ", isNot(equalToIgnoringCase(@"heLLo")));
    assertThat(@" heLLo", isNot(equalToIgnoringCase(@"heLLo")));
}


- (void) testFailsIfMatchingAgainstNil
{
    assertThat(nil, isNot(equalToIgnoringCase(@"heLLo")));
}


- (void) testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(equalToIgnoringCase(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"equalToIgnoringCase(\"heLLo\")",
                      equalToIgnoringCase(@"heLLo"));
}


@end
