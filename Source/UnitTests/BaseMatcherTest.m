//
//  OCHamcrest - BaseMatcherTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#import <OCHamcrest/HCBaseMatcher.h>
#import <OCHamcrest/HCDescription.h>


@interface TestingBaseMatcher : HCBaseMatcher
@end

@implementation TestingBaseMatcher

- (void) describeTo:(id<HCDescription>)description
{
    [description appendText:@"SOME DESCRIPTION"];
}

@end


@interface BaseMatcherTest : AbstractMatcherTest
@end

@implementation BaseMatcherTest

- (void) testDescriptionShouldDescribeMatcher
{
    TestingBaseMatcher* matcher = [[[TestingBaseMatcher alloc] init] autorelease];
    STAssertEqualObjects(@"SOME DESCRIPTION", [matcher description], nil);
}

@end
