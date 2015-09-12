//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>

#import <OCHamcrest/HCIsEqual.h>

#import <SenTestingKit/SenTestingKit.h>


@interface AssertThatTest : SenTestCase
@end

@implementation AssertThatTest

- (void)testSuccessfulMatch_ShouldBeSilent
{
    assertThat(@"foo", equalTo(@"foo"));
}

- (void)assertThatResultMessage:(NSString *)resultMessage containsExpectedMessage:(NSString *)expectedMessage
{
    STAssertNotNil(resultMessage, nil);
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

@end


@interface MockXCTestCase : SenTestCase
@property (nonatomic, copy) NSString *failureDescription;
@property (nonatomic, copy) NSString *failureFile;
@property (nonatomic, assign) NSUInteger failureLine;
@property (nonatomic, assign) BOOL failureExpected;
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
    STAssertNotNil(resultString, nil);
    STAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound, nil);
}

- (void)testXCTestCase_ShouldRecordFailureWithMismatchDescription
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    assertThat(actual, equalTo(expected));

    STAssertEqualObjects(expectedMessage, self.failureDescription, nil);
}

- (void)testXCTestCase_ShouldRecordFailureWithCurrentFileName
{
    assertThat(@1, equalTo(@0));

    [self assertThatResultString:self.failureFile containsExpectedString:@"/AssertThatTest.m"];
}

- (void)testXCTestCase_ShouldRecordFailureWithCurrentLineNumber
{
    NSUInteger assertLine = __LINE__ + 1;
    assertThat(@1, equalTo(@0));

    STAssertEquals(self.failureLine, assertLine, nil);
}

- (void)testXCTestCase_ShouldRecordFailureAsExpectedMeaningAnAssertionFailure
{
    assertThat(@1, equalTo(@0));

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
{
    GenericTestCase *testCase;
}

- (void)setUp
{
    [super setUp];
    testCase = [[GenericTestCase alloc] init];
}

- (void)assertThatResultString:(NSString *)resultString containsExpectedString:(NSString *)expectedString
{
    STAssertNotNil(resultString, nil);
    STAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound, nil);
}

- (void)testGenericTestCase_ShouldRaiseExceptionWithReasonContainingMismatchDescription
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    @try
    {
        HC_assertThatWithLocation(testCase, actual, equalTo(expected), "", 0);
    }
    @catch (NSException* exception)
    {
        [self assertThatResultString:[exception reason] containsExpectedString:expectedMessage];
        return;
    }
    STFail(@"Expected exception");
}

- (void)testGenericTestCase_ShouldRaiseExceptionWithReasonContainingLocation
{
    @try
    {
        HC_assertThatWithLocation(testCase, @1, equalTo(@0), "FILENAME", 123);
    }
    @catch (NSException* exception)
    {
        [self assertThatResultString:[exception reason] containsExpectedString:@"FILENAME:123"];
        return;
    }
    STFail(@"Expected exception");
}

@end
