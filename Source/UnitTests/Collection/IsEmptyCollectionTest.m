//
//  OCHamcrest - IsEmptyCollectionTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsEmptyCollection.h>

    // Test support
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface IsEmptyCollectionTest : AbstractMatcherTest
@end


@implementation IsEmptyCollectionTest

- (id<HCMatcher>) createMatcher
{
    return empty();
}


- (void) testMatchesEmptyCollection
{
    assertMatches(@"empty", empty(), [FakeWithCount fakeWithCount:0]);
}


- (void) testDoesNotMatchesNonEmptyCollection
{
    assertDoesNotMatch(@"non-empty", empty(), [FakeWithCount fakeWithCount:1]);
}


- (void) testDoesNotMatchItemWithoutCount
{
    assertDoesNotMatch(@"no count", empty(), [FakeWithoutCount fake]);
}


- (void) testHasReadableDescription
{
    assertDescription(@"empty collection", empty());
}


- (void) testDescribesMismatch
{
    assertDescribeMismatch(@"was <FakeWithCount>", empty(), [FakeWithCount fakeWithCount:1]);
}

@end
