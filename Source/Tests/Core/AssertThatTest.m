//
//  OCHamcrest - AssertThatTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
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
#import <OCHamcrest/HCStringContains.h>

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


//@interface QuietTest : SenTestCase
//@end
//
//@implementation QuietTest
//
//- (Class)testRunClass
//{
//    return [MockTestRun class];
//}
//
//- (void)twoFailingAssertions
//{
//    assertThat(@"1", equalTo(@"2"));
//    assertThat(@"3", equalTo(@"4"));
//}
//
//@end


@interface AssertThatTest : SenTestCase
@end

@implementation AssertThatTest

- (void)testSuccessfulMatch_ShouldBeSilent
{
    assertThat(@"foo", equalTo(@"foo"));
}

- (void)assertThatResultMessage:(NSString *)resultMessage containsExpectedMessage:(NSString *)expectedMessage
{
    STAssertTrue([resultMessage rangeOfString:expectedMessage].location != NSNotFound, nil);
}

- (void)testOCUnitAssertionError_ShouldDescribeExpectedAndActual
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
        [self assertThatResultMessage:[exception reason] containsExpectedMessage:expectedMessage];
        return;
    }
    STFail(@"should have failed");
}

- (void)testOCUnitAssertionError_ShouldCorrectlyDescribeStringsWithPercentSymbols
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
        [self assertThatResultMessage:[exception reason] containsExpectedMessage:expectedMessage];
        return;
    }
    STFail(@"should have failed");
}

//- (void)testAssertionRecordingAllErrors
//{
//    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
//    [testCase continueAfterFailure];    // Default behavior of OCUnit
//
//    MockTestRun *testRun = (MockTestRun *)[testCase run];
//
//    STAssertEquals([testRun failureCount], 2U, nil);
//    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
//}

//- (void)testAssertionStoppingAtFirstError
//{
//    QuietTest *testCase = [QuietTest testCaseWithSelector:@selector(twoFailingAssertions)];
//    [testCase raiseAfterFailure];       // Change behavior
//
//    MockTestRun *testRun = (MockTestRun *)[testCase run];
//
//    STAssertEquals([testRun failureCount], 1U, nil);
//    STAssertEquals([testRun unexpectedExceptionCount], 0U, nil);
//}

@end


@interface MockXCTestCase : SenTestCase
@property (nonatomic, copy) NSString *failureDescription;
@property (nonatomic, copy) NSString *failureFile;
@property (nonatomic) NSUInteger failureLine;
@property (nonatomic) BOOL failureExpected;
@end

@implementation MockXCTestCase

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected
{
    self.failureDescription = description;
    self.failureFile = filename;
    self.failureLine = lineNumber;
    self.failureExpected = expected;
}

- (void)assertThatResultString:(NSString *)resultString containsExpectedString:(NSString *)expectedString
{
    STAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound, nil);
}

- (void)testXCTestCase_ShouldCaptureAssertionFailure
{
    // given
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    // when
    assertThat(actual, equalTo(expected));

    // then
    STAssertEqualObjects(expectedMessage, self.failureDescription, nil);
    [self assertThatResultString:self.failureFile containsExpectedString:@"/AssertThatTest.m"];
    STAssertTrue(self.failureLine > 0, nil);
    STAssertTrue(self.failureExpected, nil);
}

@end


@interface GenericTestCase : NSObject
@end

@implementation GenericTestCase
@end


@interface GenericTestCaseTest : SenTestCase
@end

@implementation GenericTestCaseTest

- (void)testGenericTestCase_ShouldRaiseExceptionWithLocationAndReason
{
    // given
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    GenericTestCase *testCase = [[GenericTestCase alloc] init];
    
    // when
    @try
    {
        HC_assertThatWithLocation(testCase, actual, equalTo(expected), "FILENAME", 123);
        STFail(@"Expected exception");
    }
    @catch (NSException* exception)
    {
        NSString *reason = [exception reason];
        assertThat(reason, containsString(@"FILENAME:123"));
        assertThat(reason, containsString(expectedMessage));
    }
}

@end


