//
//  OCHamcrest - HasDescriptionTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
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


static NSString* fakeDescription = @"fake description";

@interface FakeDescriptionObject : NSObject
@end

@implementation FakeDescriptionObject
+ (id) fake  { return [[[self alloc] init] autorelease]; }
- (NSString*) description  { return fakeDescription; }
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
    FakeDescriptionObject* obj = [FakeDescriptionObject fake];
    assertThat(obj, hasDescription(equalTo(fakeDescription)));
    assertThat(obj, isNot(hasDescription(equalTo(@"other"))));
}


- (void) testProvidesConvenientShortcutForDescriptionEqualTo
{
    FakeDescriptionObject* obj = [FakeDescriptionObject fake];
    assertThat(obj, hasDescription(fakeDescription));
    assertThat(obj, isNot(hasDescription(@"other")));
}


- (void) testMismatchDoesNotRepeatTheDescription
{
    FakeDescriptionObject* obj = [FakeDescriptionObject fake];
    assertMismatchDescription(@"was \"fake description\"", hasDescription(@"other"), obj);
}


- (void) testHasReadableDescription
{
    id<HCMatcher> descriptionMatcher = equalTo(fakeDescription);
    id<HCMatcher> matcher = hasDescription(descriptionMatcher);

    STAssertEqualObjects([matcher description],
                         ([NSString stringWithFormat:@"object with description %@",
                                        [descriptionMatcher description]]),
                         nil);
}

@end
