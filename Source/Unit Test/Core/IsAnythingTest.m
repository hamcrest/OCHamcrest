#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsAnything.h>
#import <hamcrest/HCMatcherAssert.h>


@interface IsAnythingTest : AbstractMatcherTest
@end

@implementation IsAnythingTest

- (id<HCMatcher>) createMatcher
{
    return anything();
}


- (void) testAlwaysEvaluatesToTrue
{
    assertThat(nil, anything());
    assertThat([[[NSObject alloc] init] autorelease], anything());
    assertThat(@"hi", anything());
}


- (void) testHasUsefulDefaultDescription
{
    assertDescription(@"ANYTHING", anything());
}


- (void) testCanOverrideDescription
{
    NSString* description = @"description";
    assertDescription(description, anythingWithDescription(description));
}

@end
