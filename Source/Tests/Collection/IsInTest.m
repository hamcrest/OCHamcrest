//
//  OCHamcrest - IsInTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsIn.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsInTest : AbstractMatcherTest
@end

@implementation IsInTest

- (id<HCMatcher>)createMatcher
{
    NSArray *collection = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    return isIn(collection);
}

- (void)testReturnsTrueIfArgumentIsInCollection
{
    NSArray *collection = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    id<HCMatcher> matcher = isIn(collection);
    
    assertMatches(@"has a", matcher, @"a");
    assertMatches(@"has b", matcher, @"b");
    assertMatches(@"has c", matcher, @"c");
    assertDoesNotMatch(@"no d", matcher, @"d");
}

- (void)testMatcherCreationRequiresObjectWithContainsObjectMethod
{
    id object = [[[NSObject alloc] init] autorelease];
    
    STAssertThrows(isIn(object), @"object does not have -containsObject: method");
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(isIn(nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    id<HCMatcher> matcher = isIn([NSArray arrayWithObjects:@"a", @"b", @"c", nil]);
    
    assertDescription(@"one of {\"a\", \"b\", \"c\"}", matcher);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", isIn([NSArray arrayWithObject:@"a"]), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was \"bad\"", isIn([NSArray arrayWithObject:@"a"]), @"bad");
}

@end
