//
//  UnitTests - OrderingComparisonTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCOrderingComparison.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>

@interface OrderingComparisonTest : AbstractMatcherTest
@end

@implementation OrderingComparisonTest

- (id<HCMatcher>) createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}


- (void) testComparesObjectsForGreaterThan
{
    assertThat([NSNumber numberWithInt:2], greaterThan([NSNumber numberWithInt:1]));
    assertThat([NSNumber numberWithInt:0], isNot(greaterThan([NSNumber numberWithInt:1])));
}


- (void) testComparesObjectsForLessThan
{
    assertThat([NSNumber numberWithInt:2], lessThan([NSNumber numberWithInt:3]));
    assertThat([NSNumber numberWithInt:0], lessThan([NSNumber numberWithInt:1]));
}


- (void) testComparesObjectsForGreaterThanOrEqualTo
{
    assertThat([NSNumber numberWithInt:2], greaterThanOrEqualTo([NSNumber numberWithInt:1]));
    assertThat([NSNumber numberWithInt:1], greaterThanOrEqualTo([NSNumber numberWithInt:1]));
    assertThat([NSNumber numberWithInt:0], isNot(greaterThanOrEqualTo([NSNumber numberWithInt:1])));
}


- (void) testComparesObjectsForLessThanOrEqualTo
{
    assertThat([NSNumber numberWithInt:0], lessThanOrEqualTo([NSNumber numberWithInt:1]));
    assertThat([NSNumber numberWithInt:1], lessThanOrEqualTo([NSNumber numberWithInt:1]));
    assertThat([NSNumber numberWithInt:2], isNot(lessThanOrEqualTo([NSNumber numberWithInt:1])));
}


- (void) testSupportsDifferentTypesOfComparableObjects
{
    assertThat(@"cc", greaterThan(@"bb"));
    assertThat([NSDate distantFuture], greaterThan([NSDate distantPast]));
}


- (void) testConstructorRequiresObjectWithCompareMethod
{
    id object = [[[NSObject alloc] init] autorelease];
    
    STAssertThrows(greaterThan(object), @"object does not have compare: method");
}


- (void) testHasAReadableDescription
{
    id one = [NSNumber numberWithInt:1];
    
    assertDescription(@"a value greater than <1>", greaterThan(one));
    assertDescription(@"a value greater than or equal to <1>", greaterThanOrEqualTo(one));
    assertDescription(@"a value less than <1>", lessThan(one));
    assertDescription(@"a value equal to or less than <1>", lessThanOrEqualTo(one));
}


- (void) testDoesNotMatchNil
{
    assertDoesNotMatch(@"should not match nil", greaterThan([NSNumber numberWithInt:1]), nil);
}

@end
