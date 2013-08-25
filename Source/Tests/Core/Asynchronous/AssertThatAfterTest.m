//
//  OCHamcrest - AssertThatAfterTest.m
//  Copyright 2013 hamcrest.org. All rights reserved.
//
//  Created by: Sergio Padrino
//

// Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThatAfter.h>

// Collaborators
#import <OCHamcrest/HCIsEqual.h>

// Test support
#import <SenTestingKit/SenTestingKit.h>
#import "MockRun.h"

static NSTimeInterval const TIME_ERROR_MARGIN = 0.1f;

#pragma mark -

@interface AssertThatAfterQuietTest : SenTestCase
@end

@implementation AssertThatAfterQuietTest

- (Class)testRunClass
{
    return [MockTestRun class];
}

- (void)twoFailingAssertions
{
    NSTimeInterval irrelevantMaxTime = 0;
    assertThatAfter(irrelevantMaxTime, futureValueOf(@"1"), equalTo(@"2"));
    assertThatAfter(irrelevantMaxTime, futureValueOf(@"3"), equalTo(@"4"));
}

@end

#pragma mark -

@interface AssertThatAfterTest : SenTestCase
@end

@implementation AssertThatAfterTest

- (void)testShouldBeSilentOnSuccessfulMatchWithTimeoutZero
{
    assertThatAfter(0, futureValueOf(@"foo"), equalTo(@"foo"));
}

- (void)testShouldBeSilentOnSuccessfulMatchWithTimeoutGreaterThanZero
{
    assertThatAfter(5, futureValueOf(@"foo"), equalTo(@"foo"));
}

- (void)testFailsImmediatelyWithTimeoutZero
{
    NSTimeInterval maxTime = 0;
    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        @try
        {
            [self raiseAfterFailure];
            assertThatAfter(maxTime, futureValueOf(@"foo"), equalTo(@"bar"));
        }
        @catch (NSException *exception)
        {
            return;
        }
        
        STFail(@"should have failed");
    }];
    
    STAssertEqualsWithAccuracy(waitTime, maxTime, TIME_ERROR_MARGIN, @"Assert should have failed immediately");
}

- (void)testFailsAfterTimeoutGreaterThanZero
{
    NSTimeInterval maxTime = 0.2;
    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        @try
        {
            [self raiseAfterFailure];
            assertThatAfter(maxTime, futureValueOf(@"foo"), equalTo(@"bar"));
        }
        @catch (NSException *exception)
        {
            return;
        }
        
        STFail(@"should have failed");
    }];
    
    STAssertEqualsWithAccuracy(waitTime, maxTime, TIME_ERROR_MARGIN, @"Assert should have failed after %f seconds", maxTime);
}

- (void)testAssertWithTimeoutGreaterThanZeroShouldSucceedNotImmediatelyButBeforeTimeout
{
    NSTimeInterval maxTime = 1.0;
    NSTimeInterval succeedTime = 0.2;

    __block NSString *futureBar = @"foo";

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(succeedTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        futureBar = @"bar";
    });

    NSTimeInterval waitTime = [self timeExecutingBlock:^{
        @try
        {
            [self raiseAfterFailure];
            assertThatAfter(maxTime, futureValueOf(futureBar), equalTo(@"bar"));
        }
        @catch (NSException *exception)
        {
            STFail(@"should have succeeded");
        }
    }];

    STAssertEqualsWithAccuracy(waitTime, succeedTime, TIME_ERROR_MARGIN, @"Assert should have succeeded in approximately %f seconds", succeedTime);
}

- (NSTimeInterval)timeExecutingBlock:(void (^)())block
{
    NSDate *initialDate = [NSDate date];
    
    block();
    
    NSTimeInterval waitTime = -[initialDate timeIntervalSinceNow];
    
    return waitTime;
}

- (void)testAssertionErrorShouldDescribeExpectedAndActual
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    NSTimeInterval irrelevantMaxTime = 0;
    
    @try
    {
        [self raiseAfterFailure];
        assertThatAfter(irrelevantMaxTime, futureValueOf(actual), equalTo(expected));
    }
    @catch (NSException* exception)
    {
        STAssertTrue([[exception reason] rangeOfString:expectedMessage].location != NSNotFound, nil);
        return;
    }
    STFail(@"should have failed");
}

- (void)testAssertionErrorShouldCorrectlyDescribeStringsWithPercentSymbols
{
    NSString *expected = @"%s";
    NSString *actual = @"%d";
    NSString *expectedMessage = @"Expected \"%s\", but was \"%d\"";
    NSTimeInterval irrelevantMaxTime = 0;

    @try
    {
        [self raiseAfterFailure];
        assertThatAfter(irrelevantMaxTime, futureValueOf(actual), equalTo(expected));
    }
    @catch (NSException* exception)
    {
        STAssertTrue([[exception reason] rangeOfString:expectedMessage].location != NSNotFound, nil);
        return;
    }
    STFail(@"should have failed");
}

- (void)testAssertionRecordingAllErrors
{
    AssertThatAfterQuietTest *testCase = [AssertThatAfterQuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase continueAfterFailure];    // Default behavior of OCUnit
    
    MockTestRun *testRun = (MockTestRun *)[testCase run];
    
    STAssertEquals([testRun failureCount], 2U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

- (void)testAssertionStoppingAtFirstError
{
    AssertThatAfterQuietTest *testCase = [AssertThatAfterQuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase raiseAfterFailure];       // Change behavior
    
    MockTestRun *testRun = (MockTestRun *)[testCase run];
    
    STAssertEquals([testRun failureCount], 1U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

@end
