//
//  OCHamcrest - BaseMatcherTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#import <OCHamcrest/HCBaseMatcher.h>

    // Collaborators
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
    TestingBaseMatcher *matcher = [[TestingBaseMatcher alloc] init];
    STAssertEqualObjects([matcher description], @"SOME DESCRIPTION", nil);
}

@end


#pragma mark -

@interface IncompleteBaseMatcher : HCBaseMatcher
@end

@implementation IncompleteBaseMatcher
@end


@interface IncompleteMatcherTest : AbstractMatcherTest
@end

@implementation IncompleteMatcherTest
{
    IncompleteBaseMatcher *matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = [[IncompleteBaseMatcher alloc] init];
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (void)testSubclassShouldBeRequiredToDefineMatchesMethod
{
    STAssertThrows([matcher matches:nil], nil);
}

- (void)testSubclassShouldBeRequiredToDefineDescribeToMethod
{
    STAssertThrows([matcher describeTo:nil], nil);
}

@end
