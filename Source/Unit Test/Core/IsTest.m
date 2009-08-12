#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <OCHamcrest/HCIs.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsTest : AbstractMatcherTest
@end

@implementation IsTest

- (id<HCMatcher>) createMatcher
{
    return is(@"something");
}


- (void) testJustMatchesTheSameWayTheUnderylingMatcherDoes
{
    assertMatches(@"should match", is(equalTo(@"A")), @"A");
    assertMatches(@"should match", is(equalTo(@"B")), @"B");
    assertDoesNotMatch(@"should not match", is(equalTo(@"A")), @"B");
    assertDoesNotMatch(@"should not match", is(equalTo(@"B")), @"A");
}


- (void) testGeneratesIsPrefixInDescription
{
    assertDescription(@"is \"A\"", is(equalTo(@"A")));
}


- (void) testProvidesConvenientShortcutForIsEqualTo
{
    assertMatches(@"should match", is(@"A"), @"A");
    assertMatches(@"should match", is(@"B"), @"B");
    assertDoesNotMatch(@"should not match", is(@"A"), @"B");
    assertDoesNotMatch(@"should not match", is(@"B"), @"A");
    assertDescription(@"is \"A\"", is(@"A"));
}

@end
