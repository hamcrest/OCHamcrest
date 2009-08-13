//
//  UnitTests - BaseMatcherTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
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

- (void) testDescribesItselfWithDescriptionMethod
{
    TestingBaseMatcher* matcher = [[[TestingBaseMatcher alloc] init] autorelease];
    assertDescription(@"SOME DESCRIPTION", matcher);
}

@end
