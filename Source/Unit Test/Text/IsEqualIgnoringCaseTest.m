#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsEqualIgnoringCase.h>
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCMatcherAssert.h>


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


- (void) testConstructorRequiresNonNilArgument
{    
    STAssertThrows(equalToIgnoringCase(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"equalToIgnoringCase(\"heLLo\")",
                        equalToIgnoringCase(@"heLLo"));
}


@end
