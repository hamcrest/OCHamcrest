//
//  OCHamcrest - OrderingComparisonTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCOrderingComparison.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface OrderingComparisonTest : AbstractMatcherTest
@end

@implementation OrderingComparisonTest

- (id<HCMatcher>)createMatcher
{
    return nil;     // Ignore the inherited tests; they don't work well for this class.
}

- (void)testComparesObjectsForGreaterThan
{
    assertMatches(@"match", greaterThan([NSNumber numberWithInt:1]), [NSNumber numberWithInt:2]);
    assertDoesNotMatch(@"no match", greaterThan([NSNumber numberWithInt:1]),
                       [NSNumber numberWithInt:1]);
}

- (void)testComparesObjectsForLessThan
{
    assertMatches(@"match", lessThan([NSNumber numberWithInt:1]), [NSNumber numberWithInt:0]);
    assertDoesNotMatch(@"no match", lessThan([NSNumber numberWithInt:1]),
                       [NSNumber numberWithInt:1]);
}

- (void)testComparesObjectsForGreaterThanOrEqualTo
{
    assertMatches(@"match", greaterThanOrEqualTo([NSNumber numberWithInt:1]),
                  [NSNumber numberWithInt:2]);
    assertMatches(@"match", greaterThanOrEqualTo([NSNumber numberWithInt:1]),
                  [NSNumber numberWithInt:1]);
    assertDoesNotMatch(@"no match", greaterThanOrEqualTo([NSNumber numberWithInt:1]),
                       [NSNumber numberWithInt:0]);
}

- (void)testComparesObjectsForLessThanOrEqualTo
{
    assertMatches(@"match", lessThanOrEqualTo([NSNumber numberWithInt:1]),
                  [NSNumber numberWithInt:0]);
    assertMatches(@"match", lessThanOrEqualTo([NSNumber numberWithInt:1]),
                  [NSNumber numberWithInt:1]);
    assertDoesNotMatch(@"no match", lessThanOrEqualTo([NSNumber numberWithInt:1]),
                       [NSNumber numberWithInt:2]);
}

- (void)testDoesNotMatchNil
{
    assertDoesNotMatch(@"nil argument", greaterThan([NSNumber numberWithInt:1]), nil);
}

- (void)testSupportsDifferentTypesOfComparableObjects
{
    assertMatches(@"strings", greaterThan(@"bb"), @"cc");
    assertMatches(@"dates", lessThan([NSDate date]), [NSDate distantPast]);
}

- (void)testMatcherCreationRequiresObjectWithCompareMethod
{
    id object = [[[NSObject alloc] init] autorelease];
    STAssertThrows(greaterThan(object), @"object does not have -compare: method");
}

- (void)testHasAReadableDescription
{
    id one = [NSNumber numberWithInt:1];
    
    assertDescription(@"a value greater than <1>", greaterThan(one));
    assertDescription(@"a value greater than or equal to <1>", greaterThanOrEqualTo(one));
    assertDescription(@"a value less than <1>", lessThan(one));
    assertDescription(@"a value less than or equal to <1>", lessThanOrEqualTo(one));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    id one = [NSNumber numberWithInt:1];

    assertNoMismatchDescription(greaterThan(one), [NSNumber numberWithInt:2]);
    assertNoMismatchDescription(lessThan(one), [NSNumber numberWithInt:0]);
    assertNoMismatchDescription(greaterThanOrEqualTo(one), [NSNumber numberWithInt:1]);
    assertNoMismatchDescription(lessThanOrEqualTo(one), [NSNumber numberWithInt:1]);
}

- (void)testMismatchDescription
{
    id one = [NSNumber numberWithInt:1];
    
    assertMismatchDescription(@"was <0>", greaterThan(one), [NSNumber numberWithInt:0]);
    assertMismatchDescription(@"was <2>", lessThan(one), [NSNumber numberWithInt:2]);
    assertMismatchDescription(@"was <0>", greaterThanOrEqualTo(one), [NSNumber numberWithInt:0]);
    assertMismatchDescription(@"was <2>", lessThanOrEqualTo(one), [NSNumber numberWithInt:2]);
}

- (void)testDescribeMismatch
{
    id one = [NSNumber numberWithInt:1];
    
    assertDescribeMismatch(@"was <0>", greaterThan(one), [NSNumber numberWithInt:0]);
    assertDescribeMismatch(@"was <2>", lessThan(one), [NSNumber numberWithInt:2]);
    assertDescribeMismatch(@"was <0>", greaterThanOrEqualTo(one), [NSNumber numberWithInt:0]);
    assertDescribeMismatch(@"was <2>", lessThanOrEqualTo(one), [NSNumber numberWithInt:2]);
}

@end
