//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>

#import "MatcherTestCase.h"
#import <OCHamcrest/HCStringDescription.h>


@interface BaseMatcherWithDescription : HCBaseMatcher
@end

@implementation BaseMatcherWithDescription

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"SOME DESCRIPTION"];
}

@end


@interface HCBaseMatcherTests : MatcherTestCase
@end

@implementation HCBaseMatcherTests
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
    XCTAssertEqualObjects(matcher.description, @"SOME DESCRIPTION");
}

- (void)testShouldSupportImmutableCopying
{
    BaseMatcherWithDescription *matcherCopy = [matcher copy];
    XCTAssertEqual(matcherCopy, matcher);
}

@end


@interface IncompleteBaseMatcher : HCBaseMatcher
@end

@implementation IncompleteBaseMatcher
@end


@interface IncompleteMatcherTests : MatcherTestCase
@end

@implementation IncompleteMatcherTests
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
    XCTAssertThrows([matcher matches:nil]);
}

- (void)testSubclassShouldBeRequiredToDefineDescribeToMethod
{
    XCTAssertThrows([matcher describeTo:[[HCStringDescription alloc] init]]);
}

@end
