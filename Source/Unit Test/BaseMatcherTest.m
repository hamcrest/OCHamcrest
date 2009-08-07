#import "AbstractMatcherTest.h"

#import <hamcrest/HCBaseMatcher.h>
#import <hamcrest/HCDescription.h>


@interface TestingBaseMatcher : HCBaseMatcher
@end

@implementation TestingBaseMatcher

- (void) describeTo:(id<HCDescription>)description
{
    [description appendText:@"SOME DESCRIPTION"];
}

@end


@interface BaseMatcherTest : AbstractMatcherTest
@end

@implementation BaseMatcherTest

- (void) testDescribesItselfWithDescriptionMethod
{
    TestingBaseMatcher* matcher = [[[TestingBaseMatcher alloc] init] autorelease];
    assertDescription(@"SOME DESCRIPTION", matcher);
}

@end
