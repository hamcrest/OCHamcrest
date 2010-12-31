//
//  OCHamcrest - IsCloseToTest.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCloseTo.h>


@interface IsCloseToTest : AbstractMatcherTest
@end

@implementation IsCloseToTest

- (id<HCMatcher>) createMatcher
{
    double irrelevant = 0.1;
    return closeTo(irrelevant, irrelevant);
}


- (void) testEvaluatesToTrueIfArgumentIsEqualToADoubleValueWithinSomeError
{
    id<HCMatcher> p = closeTo(1.0, 0.5);
    
    STAssertTrue([p matches:[NSNumber numberWithDouble:1.0]], nil);
    STAssertTrue([p matches:[NSNumber numberWithDouble:0.5]], nil);
    STAssertTrue([p matches:[NSNumber numberWithDouble:1.5]], nil);

    STAssertFalse([p matches:[NSNumber numberWithDouble:2.0]], @"number too large");
    STAssertFalse([p matches:[NSNumber numberWithDouble:2.0]], @"number too large");
    STAssertFalse([p matches:@"a"], @"not a number");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a numeric value within <0.5> of <1>", closeTo(1.0, 0.5));
}


- (void) testFailsIfMatchingAgainstNonNumber
{
    id<HCMatcher> p = closeTo(1.0, 0.5);
    
    STAssertFalse([p matches:@"a"], @"not a number");
    STAssertFalse([p matches:nil], @"not a number");
}

@end
