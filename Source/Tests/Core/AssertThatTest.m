//
//  OCHamcrest - AssertThatTest.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import <SenTestingKit/SenTestingKit.h>


@interface MockTestRun : SenTestCaseRun
{
    // Can't use original attributes because they're declared @private.
    unsigned int myFailureCount;
    unsigned int myUnexpectedExceptionCount;
}
@end

@implementation MockTestRun

- (void)addException:(NSException *) anException
{
    if ([[anException name] isEqualToString:SenTestFailureException])
        ++myFailureCount;
    else
        ++myUnexpectedExceptionCount;
}

- (unsigned int)failureCount
{
    return myFailureCount;
}

- (unsigned int)unexpectedExceptionCount
{
    return myUnexpectedExceptionCount;
}

- (void)stop
{
    // Override to avoid posting notification.
}

@end


#pragma mark -

@interface QuietTest : SenTestCase
@end

@implementation QuietTest

- (Class)testRunClass
{
    return [MockTestRun class];
}

- (void)twoFailingAssertions
{
    assertThat(@"1", equalTo(@"2"));
    assertThat(@"3", equalTo(@"4"));
}

@end


#pragma mark -

@interface AssertThatTest : SenTestCase
@end

@implementation AssertThatTest

- (void)testShouldBeSilentOnSuccessfulMatch
{
    assertThat(@"foo", equalTo(@"foo"));
}

- (void)testAssertionErrorShouldDescribeExpectedAndActual
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    @try
    {
        [self raiseAfterFailure];
        assertThat(actual, equalTo(expected));
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

    @try
    {
        [self raiseAfterFailure];
        assertThat(actual, equalTo(expected));
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
    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase continueAfterFailure];    // Default behavior of OCUnit

    MockTestRun *testRun = (MockTestRun *)[testCase run];

    STAssertEquals([testRun failureCount], 2U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

- (void)testAssertionStoppingAtFirstError
{
    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase raiseAfterFailure];       // Change behavior

    MockTestRun *testRun = (MockTestRun *)[testCase run];

    STAssertEquals([testRun failureCount], 1U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

@end

#pragma mark -

@interface WillAssertThatTest : SenTestCase
@end

@implementation WillAssertThatTest

- (void)testShouldBehaveAsAssertThatForNonAsyncMatches
{
    willAssertThat(@"foo", equalTo(@"foo"));
}

- (void)testWaitForMatchesToSucceed
{
    __block NSString *foo = @"";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 10*NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        foo = @"foo";
    });

    willAssertThat(foo, equalTo(@"foo"));
}

- (void)testTimeoutsWhenMatchesDoNotSucceed
{
    NSString *expected = @"EXPECTED";
    __block NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"SOMETHING ELSE\"";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 10*NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        actual = @"SOMETHING ELSE";
    });

    @try
    {
        [self raiseAfterFailure];
        willAssertThat(actual, equalTo(expected));
    }
    @catch (NSException* exception)
    {
        NSLog(@"%@", [exception reason]);
        STAssertTrue([[exception reason] rangeOfString:expectedMessage].location != NSNotFound, nil);
        return;
    }
    STFail(@"should have failed");
}

@end
