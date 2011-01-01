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
#import <OCHamcrest/HCIsEmptyCollection.h>
#import <OCHamcrest/HCMatcherAssert.h>

    // Test support
#import "FakeCountingObject.h"
#import "FakeNonCountingObject.h"


@interface IsEmptyCollectionTest : AbstractMatcherTest
@end


@implementation IsEmptyCollectionTest

- (id<HCMatcher>) createMatcher
{
    return empty();
}


- (void) testMatchesEmptyCollection
{
    assertMatches(@"empty", empty(), [FakeCountingObject fakeWithCount:0]);
}


- (void) testDoesNotMatchesNonEmptyCollection
{
    assertDoesNotMatch(@"non-empty", empty(), [FakeCountingObject fakeWithCount:1]);
}


- (void) testDoesNotMatchItemWithoutCount
{
    assertDoesNotMatch(@"no count", empty(), [FakeNonCountingObject fake]);
}


- (void) testHasReadableDescription
{
    assertDescription(@"empty collection", empty());
}


- (void) testDescribesMismatch
{
    assertDescribeMismatch(@"was <counting>", empty(), [FakeCountingObject fakeWithCount:1]);
}

@end
