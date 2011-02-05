//
//  OCHamcrest - AssertThatTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>

    // Other OCHamcrest
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import <SenTestingKit/SenTestingKit.h>


@interface QuietTestRun : SenTestCaseRun
{
    // Can't use original attributes because they're declared @private.
    unsigned int myFailureCount;
    unsigned int myUnexpectedExceptionCount;
}
@end

@implementation QuietTestRun

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

@end

//--------------------------------------------------------------------------------------------------

@interface QuietTest : SenTestCase
@end

@implementation QuietTest

- (Class)testRunClass
{
    return [QuietTestRun class];
}

- (void)twoFailingAssertions
{
    assertThat(@"1", equalTo(@"2"));
    assertThat(@"3", equalTo(@"4"));
}

@end

//==================================================================================================

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


- (void)testAssertion_recordingAllErrors
{
    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase continueAfterFailure];    // Default behavior of OCUnit
    
    QuietTestRun *testRun = (QuietTestRun *)[testCase run];

    STAssertEquals([testRun failureCount], 2U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}


- (void)testAssertion_stoppingAtFirstError
{
    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
    [testCase raiseAfterFailure];
    
    QuietTestRun *testRun = (QuietTestRun *)[testCase run];

    STAssertEquals([testRun failureCount], 1U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

@end
