//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt
//  Contribution by Sergio Padrino

#define HC_SHORTHAND

#import <OCHamcrest/HCAssertThat.h>

#import <OCHamcrest/HCIsEqual.h>

#import <XCTest/XCTest.h>
#import "InterceptingTestCase.h"

static NSTimeInterval const TIME_ERROR_MARGIN = 0.1f;


@interface AssertWithTimeoutTests : InterceptingTestCase
@end


@implementation AssertWithTimeoutTests

- (void)testShouldBeSilentOnSuccessfulMatchWithTimeoutZero
{
    assertWithTimeout(0, thatEventually(@"foo"), equalTo(@"foo"));

    XCTAssertNil(self.testFailure);
}

- (void)testShouldBeSilentOnSuccessfulMatchWithTimeoutGreaterThanZero
{
    assertWithTimeout(5, thatEventually(@"foo"), equalTo(@"foo"));

    XCTAssertNil(self.testFailure);
}

- (void)testFailsImmediatelyWithTimeoutZero
{
    NSTimeInterval maxTime = 0;
    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        assertWithTimeout(maxTime, thatEventually(@"foo"), equalTo(@"bar"));
    }];

    XCTAssertEqualWithAccuracy(waitTime, maxTime, TIME_ERROR_MARGIN,
            @"Assert should have failed immediately");
}

- (void)testFailsAfterTimeoutGreaterThanZero
{
    NSTimeInterval maxTime = 0.2;
    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        assertWithTimeout(maxTime, thatEventually(@"foo"), equalTo(@"bar"));
    }];

    XCTAssertEqualWithAccuracy(waitTime, maxTime, TIME_ERROR_MARGIN,
            @"Assert should have failed after %f seconds", maxTime);
}

- (void)testAssertWithTimeoutGreaterThanZeroShouldSucceedNotImmediatelyButBeforeTimeout
{
    NSTimeInterval maxTime = 1.0;
    NSTimeInterval succeedTime = 0.2;
    __block NSString *futureBar = @"foo";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(succeedTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        futureBar = @"bar";
    });

    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        assertWithTimeout(maxTime, thatEventually(futureBar), equalTo(@"bar"));
    }];

    XCTAssertTrue(waitTime > succeedTime - 0.01, @"Expect assert to terminate after value is changed, but was %lf", waitTime);
    XCTAssertTrue(waitTime < maxTime, @"Expect assert to terminate before timeout, but was %lf", waitTime);
}

- (void)testDeprecatedAssertThatAfter_WithTimeoutGreaterThanZeroShouldSucceedNotImmediatelyButBeforeTimeout
{
    NSTimeInterval maxTime = 1.0;
    NSTimeInterval succeedTime = 0.2;
    __block NSString *futureBar = @"foo";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(succeedTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        futureBar = @"bar";
    });

    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        @try {
            assertThatAfter(maxTime, futureValueOf(futureBar), equalTo(@"bar"));
        }
        @catch (NSException *exception) {
            XCTFail(@"should have succeeded");
        }
    }];

    XCTAssertTrue(waitTime > succeedTime, @"Expect assert to terminate after value is changed, but was %lf", waitTime);
    XCTAssertTrue(waitTime < maxTime, @"Expect assert to terminate before timeout, but was %lf", waitTime);
}

- (NSTimeInterval)timeExecutingBlock:(void (^)())block
{
    NSDate *initialDate = [NSDate date];
    block();
    NSTimeInterval waitTime = -[initialDate timeIntervalSinceNow];
    return waitTime;
}

- (void)assertThatResultString:(NSString *)resultString containsExpectedString:(NSString *)expectedString
{
    XCTAssertNotNil(resultString);
    XCTAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound);
}

- (void)testAssertionErrorShouldDescribeExpectedAndActual
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    NSTimeInterval irrelevantMaxTime = 0;

    assertWithTimeout(irrelevantMaxTime, thatEventually(actual), equalTo(expected));

    [self assertThatResultString:self.testFailure.reason containsExpectedString:expectedMessage];
}

@end
