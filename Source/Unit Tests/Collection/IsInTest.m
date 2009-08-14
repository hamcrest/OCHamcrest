//
//  OCHamcrest - IsInTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsIn.h>


@interface IsInTest : AbstractMatcherTest
@end

@implementation IsInTest

- (id<HCMatcher>) createMatcher
{
    NSArray* collection = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    return isIn(collection);
}


- (void) testReturnsTrueIfArgumentIsInCollection
{
    NSArray* collection = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    id<HCMatcher> matcher = isIn(collection);
    
    assertMatches(@"a", matcher, @"a");
    assertMatches(@"b", matcher, @"b");
    assertMatches(@"c", matcher, @"c");
    assertDoesNotMatch(@"d", matcher, @"d");
}


- (void) testConstructorRequiresObjectWithContainsObjectMethod
{
    id object = [[[NSObject alloc] init] autorelease];
    
    STAssertThrows(isIn(object), @"object does not have containsObject: method");
}


- (void) testHasReadableDescription
{
    id<HCMatcher> matcher = isIn([NSArray arrayWithObjects:@"a", @"b", @"c", nil]);
    
    assertDescription(@"one of {\"a\", \"b\", \"c\"}", matcher);
}

@end
