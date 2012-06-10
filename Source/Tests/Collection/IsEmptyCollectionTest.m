//
//  OCHamcrest - IsEmptyCollectionTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEmptyCollection.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface IsEmptyCollectionTest : AbstractMatcherTest
@end


@implementation IsEmptyCollectionTest

- (id<HCMatcher>)createMatcher
{
    return empty();
}

- (void)testMatchesEmptyCollection
{
    assertMatches(@"empty", empty(), [FakeWithCount fakeWithCount:0]);
}

- (void)testDoesNotMatchesNonEmptyCollection
{
    assertDoesNotMatch(@"non-empty", empty(), [FakeWithCount fakeWithCount:1]);
}

- (void)testDoesNotMatchItemWithoutCount
{
    assertDoesNotMatch(@"no count", empty(), [FakeWithoutCount fake]);
}

- (void)testHasReadableDescription
{
    assertDescription(@"empty collection", empty());
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", empty(), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was <FakeWithCount>", empty(), [FakeWithCount fakeWithCount:1]);
}

@end
