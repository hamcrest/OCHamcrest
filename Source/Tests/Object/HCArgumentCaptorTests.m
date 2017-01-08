//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 Jonathan M. Reid. See LICENSE.txt

#import "HCArgumentCaptor.h"

#import "MatcherTestCase.h"


@interface HCArgumentCaptorTests : MatcherTestCase
@end

@implementation HCArgumentCaptorTests
{
    HCArgumentCaptor *sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[HCArgumentCaptor alloc] init];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testMatcher_ShouldAlwaysEvaluateToTrue
{
    assertMatches(@"nil", sut, nil);
    assertMatches(@"unknown object", sut, [[NSObject alloc] init]);
}

- (void)testMatcher_ShouldHaveReadableDescription
{
    assertDescription(@"<Capturing argument>", sut);
}

- (void)testValue_ShouldBeLastCapturedValue
{
    [sut matches:@"FOO"];
    [sut matches:@"BAR"];

    XCTAssertEqualObjects(sut.value, @"BAR");
}

- (void)testValue_WithNothingCaptured_ShouldReturnNil
{
    XCTAssertNil(sut.value);
}

- (void)testValue_GivenNil_ShouldReturnNSNull
{
    [sut matches:@"FOO"];
    [sut matches:nil];

    XCTAssertEqualObjects(sut.value, [NSNull null]);
}

- (void)testAllValues_ShouldCaptureValuesInOrder
{
    [sut matches:@"FOO"];
    [sut matches:@"BAR"];

    XCTAssertEqual(sut.allValues.count, 2U);
    XCTAssertEqualObjects(sut.allValues[0], @"FOO");
    XCTAssertEqualObjects(sut.allValues[1], @"BAR");
}

- (void)testAllValues_TurningOffCaptureEnabled_ShouldNotCaptureSubsequentValues
{
    [sut matches:@"FOO"];
    sut.captureEnabled = NO;
    [sut matches:@"BAR"];
    [sut matches:@"BAZ"];

    XCTAssertEqual(sut.allValues.count, 1U);
    XCTAssertEqualObjects(sut.allValues[0], @"FOO");
}

- (void)testAllValues_TurningCaptureEnabledBackOn_ShouldCaptureSubsequentValues
{
    sut.captureEnabled = NO;
    [sut matches:@"FOO"];
    sut.captureEnabled = YES;
    [sut matches:@"BAR"];
    [sut matches:@"BAZ"];

    XCTAssertEqual(sut.allValues.count, 2U);
    XCTAssertEqualObjects(sut.allValues[0], @"BAR");
    XCTAssertEqualObjects(sut.allValues[1], @"BAZ");
}

- (void)testAllValues_GivenNil_ShouldCaptureNSNull
{
    [sut matches:nil];

    XCTAssertEqualObjects(sut.allValues[0], [NSNull null]);
}

- (void)testAllValues_ShouldReturnImmutableArray
{
    [sut matches:@"FOO"];

    XCTAssertFalse([sut.allValues respondsToSelector:@selector(addObject:)]);
}

@end
