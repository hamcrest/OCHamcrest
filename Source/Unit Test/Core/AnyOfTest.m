#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <OCHamcrest/HCAnyOf.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


@interface AnyOfTest : AbstractMatcherTest
@end

@implementation AnyOfTest

- (id<HCMatcher>) createMatcher
{
    return anyOf(equalTo(@"irrelevant"), nil);
}


- (void) testEvaluatesToTheTheLogicalDisjunctionOfTwoOtherMatchers
{
    assertThat(@"good", anyOf(equalTo(@"good"), equalTo(@"good"), nil));
    assertThat(@"good", anyOf(equalTo(@"bad"), equalTo(@"good"), nil));
    assertThat(@"good", anyOf(equalTo(@"good"), equalTo(@"bad"), nil));
    
    assertThat(@"good", isNot(anyOf(equalTo(@"bad"), equalTo(@"bad"), nil)));
}


- (void) testEvaluatesToTheTheLogicalDisjunctionOfManyOtherMatchers
{
    assertThat(@"good", anyOf(
                            equalTo(@"bad"),
                            equalTo(@"good"),
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            nil));
    assertThat(@"good", isNot(anyOf(
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            equalTo(@"bad"),
                            nil)));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"(\"good\" or \"bad\" or \"ugly\")",
            anyOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}


@end
