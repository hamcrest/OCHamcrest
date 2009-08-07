#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsNil.h>
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCMatcherAssert.h>


@interface IsNilTest : AbstractMatcherTest
@end

@implementation IsNilTest

- (id<HCMatcher>) createMatcher
{
    return nilValue();
}


- (void) testEvaluatesToTrueIfArgumentIsNil
{
    id ANY_NON_NULL_ARGUMENT = [[[NSObject alloc] init] autorelease];
    
    assertThat(nil, nilValue());
    assertThat(ANY_NON_NULL_ARGUMENT, isNot(nilValue()));

    assertThat(ANY_NON_NULL_ARGUMENT, notNilValue());
    assertThat(nil, isNot(notNilValue()));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"nil", nilValue());
    assertDescription(@"not nil", notNilValue());
}

@end
