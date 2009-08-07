#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCIsEqual.h>


@interface IsNotTest : AbstractMatcherTest
@end

@implementation IsNotTest

- (id<HCMatcher>) createMatcher
{
    return isNot(@"something");
}


- (void) testEvaluatesToTheTheLogicalNegationOfAnotherMatcher
{
    assertMatches(@"should match", isNot(equalTo(@"A")), @"B");
    assertDoesNotMatch(@"should not match", isNot(equalTo(@"B")), @"B");
}


- (void) testProvidesConvenientShortcutForNotEqualTo
{
    assertMatches(@"should match", isNot(@"A"), @"B");
    assertMatches(@"should match", isNot(@"B"), @"A");
    assertDoesNotMatch(@"should not match", isNot(@"A"), @"A");
    assertDoesNotMatch(@"should not match", isNot(@"B"), @"B");
    assertDescription(@"not \"A\"", isNot(@"A"));
}

@end
