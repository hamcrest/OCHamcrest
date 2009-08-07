#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCHasDescription.h>
#import <hamcrest/HCIsEqual.h>
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCMatcherAssert.h>


static NSString* DESCRIPTION_RESULT = @"description result";


@interface FakeObject : NSObject
@end

@implementation FakeObject
- (NSString*) description  { return DESCRIPTION_RESULT; }
@end


@interface HasDescriptionTest : AbstractMatcherTest
@end

@implementation HasDescriptionTest

- (id<HCMatcher>) createMatcher
{
    return hasDescription(equalTo(@"irrelevant"));
}


- (void) testPassesResultOfDescriptionToNestedMatcher
{
    FakeObject* ARG = [[[FakeObject alloc] init] autorelease];
    assertThat(ARG, hasDescription(equalTo(DESCRIPTION_RESULT)));
    assertThat(ARG, isNot(hasDescription(equalTo(@"OTHER STRING"))));
}


- (void) testProvidesConvenientShortcutForDescriptionEqualTo
{
    FakeObject* ARG = [[[FakeObject alloc] init] autorelease];
    assertThat(ARG, hasDescription(DESCRIPTION_RESULT));
    assertThat(ARG, isNot(hasDescription(@"OTHER STRING")));
}


- (void) testHasReadableDescription
{
    id<HCMatcher> descriptionMatcher = equalTo(DESCRIPTION_RESULT);
    id<HCMatcher> matcher = hasDescription(descriptionMatcher);

    STAssertEqualObjects([matcher description],
                            ([[NSArray arrayWithObjects:
                                    @"description(", [descriptionMatcher description], @")", nil]
                                componentsJoinedByString:@""]),
                            nil);
}

@end
