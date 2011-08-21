//
//  OCHamcrest - IsAnythingTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsAnything.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsAnythingTest : AbstractMatcherTest
@end

@implementation IsAnythingTest

- (id<HCMatcher>)createMatcher
{
    return anything();
}

- (void)testAlwaysEvaluatesToTrue
{
    assertMatches(@"nil", anything(), nil);
    assertMatches(@"object", anything(), [[[NSObject alloc] init] autorelease]);
    assertMatches(@"string", anything(), @"hi");
}

- (void)testHasUsefulDefaultDescription
{
    assertDescription(@"ANYTHING", anything());
}

- (void)testCanOverrideDescription
{
    NSString *description = @"DESCRIPTION";
    assertDescription(description, anythingWithDescription(description));
}

- (void)testMatchAlwaysSucceedsSoShouldNotGenerateMismatchDescription
{
    assertNoMismatchDescription(anything(), @"hi");
}

@end
