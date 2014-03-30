//
//  OCHamcrest - BaseMatcherTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#import <OCHamcrest/HCBaseMatcher.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface BaseMatcherWithDescription : HCBaseMatcher
@end

@implementation BaseMatcherWithDescription

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"SOME DESCRIPTION"];
}

@end


@interface BaseMatcherTest : AbstractMatcherTest
@end

@implementation BaseMatcherTest
{
    BaseMatcherWithDescription *matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = [[BaseMatcherWithDescription alloc] init];
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (void)testDescriptionShouldDescribeMatcher
{
    STAssertEqualObjects([matcher description], @"SOME DESCRIPTION", nil);
}

- (void)testShouldSupportImmutableCopying
{
    BaseMatcherWithDescription *matcherCopy = [matcher copy];
    STAssertEquals(matcherCopy, matcher, nil);
}

@end


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
