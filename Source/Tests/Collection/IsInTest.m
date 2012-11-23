//
//  OCHamcrest - IsInTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
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
    NSArray *collection = @[@"a", @"b", @"c"];
    return isIn(collection);
}

- (void)testReturnsTrueIfArgumentIsInCollection
{
    NSArray *collection = @[@"a", @"b", @"c"];
    id<HCMatcher> matcher = isIn(collection);
    
    assertMatches(@"has a", matcher, @"a");
    assertMatches(@"has b", matcher, @"b");
    assertMatches(@"has c", matcher, @"c");
    assertDoesNotMatch(@"no d", matcher, @"d");
}

- (void)testMatcherCreationRequiresObjectWithContainsObjectMethod
{
    id object = [[NSObject alloc] init];
    
    STAssertThrows(isIn(object), @"object does not have -containsObject: method");
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(isIn(nil), @"Should require non-nil argument");
}

- (void)testHasReadableDescription
{
    id<HCMatcher> matcher = isIn(@[@"a", @"b", @"c"]);
    
    assertDescription(@"one of {\"a\", \"b\", \"c\"}", matcher);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", isIn(@[@"a"]), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was \"bad\"", isIn(@[@"a"]), @"bad");
}

@end
