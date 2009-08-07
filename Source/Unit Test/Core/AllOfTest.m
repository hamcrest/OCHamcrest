#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCAllOf.h>
#import <hamcrest/HCIsEqual.h>
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCMatcherAssert.h>


@interface AllOfTest : AbstractMatcherTest
@end

@implementation AllOfTest

- (id<HCMatcher>) createMatcher
{
    return allOf(equalTo(@"irrelevant"), equalTo(@"irrelevant"), nil);
}


- (void) testEvaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers
{
    assertThat(@"good", allOf(equalTo(@"good"), equalTo(@"good"), nil));

    assertThat(@"good", isNot(allOf(equalTo(@"bad"), equalTo(@"good"), nil)));
    assertThat(@"good", isNot(allOf(equalTo(@"good"), equalTo(@"bad"), nil)));
    assertThat(@"good", isNot(allOf(equalTo(@"bad"), equalTo(@"bad"), nil)));
}


- (void) testEvaluatesToTheTheLogicalConjunctionOfManyOtherMatchers
{
    assertThat(@"good", allOf(
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            nil));
    assertThat(@"good", isNot(allOf(
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"bad"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            nil)));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"(\"good\" and \"bad\" and \"ugly\")",
            allOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}


- (void) testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(allOf(equalTo(@"good"), equalTo(@"good"), nil), @"good");
}


- (void) testMismatchDescriptionDescribesFirstFailingMatch
{
    assertMismatchDescription(@"\"good\" was \"bad\"", allOf(equalTo(@"bad"), equalTo(@"good"), nil), @"bad");
}


- (void) testDescribeMismatch
{
    assertDescribeMismatch(@"\"good\" was \"bad\"", allOf(equalTo(@"bad"), equalTo(@"good"), nil), @"bad");
}

@end
