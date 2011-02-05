//
//  OCHamcrest - BaseMatcherTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#import <OCHamcrest/HCBaseMatcher.h>

    // Other OCHamcrest
#import <OCHamcrest/HCDescription.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface TestingBaseMatcher : HCBaseMatcher
@end

@implementation TestingBaseMatcher

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"SOME DESCRIPTION"];
}

@end


@interface BaseMatcherTest : AbstractMatcherTest
@end

@implementation BaseMatcherTest

- (void)testDescriptionShouldDescribeMatcher
{
    TestingBaseMatcher *matcher = [[[TestingBaseMatcher alloc] init] autorelease];
    STAssertEqualObjects(@"SOME DESCRIPTION", [matcher description], nil);
}

@end
