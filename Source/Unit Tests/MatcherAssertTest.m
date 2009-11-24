//
//  OCHamcrest - MatcherAssertTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <SenTestingKit/SenTestingKit.h>

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCMatcherAssert.h>
#import <OCHamcrest/HCIsEqual.h>

@interface QuietTestRun : SenTestCaseRun
{
    // Can't use original attributes because they're declared @private.
    unsigned int myFailureCount;
    unsigned int myUnexpectedExceptionCount;
}
@end

@implementation QuietTestRun

- (void) addException:(NSException *) anException
{	
    if ([[anException name] isEqualToString:SenTestFailureException])
		++myFailureCount;
	else
		++myUnexpectedExceptionCount;
}

- (unsigned int) failureCount
{
    return myFailureCount;
}

- (unsigned int) unexpectedExceptionCount
{
    return myUnexpectedExceptionCount;
}

@end


@interface QuietTest : SenTestCase
@end

@implementation QuietTest

- (Class) testRunClass
{
    return [QuietTestRun class];
}

- (void) twoFailingAssertions
{
    assertThat(@"1", equalTo(@"2"));
    assertThat(@"3", equalTo(@"4"));
}

@end


@interface MatcherAssertTest : SenTestCase
@end

@implementation MatcherAssertTest

- (void) testErrorMessage
{
    NSString* expected = @"expected";
    NSString* actual = @"actual";
    NSString* expectedMessage = @"Expected \"expected\", got \"actual\"";
    
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


- (void) testAssertion_recordingAllErrors
{
    QuietTest* testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];

    [testCase continueAfterFailure];    // Default behavior of SetTestCase
    QuietTestRun* testRun = (QuietTestRun*)[testCase run];

    STAssertEquals([testRun failureCount], 2U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}


- (void) testAssertion_stoppingAtFirstError
{
    QuietTest* testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];

    [testCase raiseAfterFailure];
    QuietTestRun* testRun = (QuietTestRun*)[testCase run];

    STAssertEquals([testRun failureCount], 1U, nil);
    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
}

@end
