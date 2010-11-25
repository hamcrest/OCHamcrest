//
//  OCHamcrest - HasDescriptionTest.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCHasDescription.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


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
                            ([NSString stringWithFormat:@"with description %@", [descriptionMatcher description]]),
                            nil);
}

@end
