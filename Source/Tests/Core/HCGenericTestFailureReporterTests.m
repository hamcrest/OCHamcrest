// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCAssertThat.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCTestFailure.h>
#import <objc/runtime.h>

@import XCTest;


@interface GenericTestCase : NSObject
@end

@implementation GenericTestCase
@end


@interface HCGenericTestFailureReporterTests : XCTestCase
@end

@implementation HCGenericTestFailureReporterTests
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
    XCTAssertNotNil(resultString);
    XCTAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound);
}

- (void)test_genericTestCase_exceptionReasonContainsMismatchDescription
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
    XCTFail(@"Expected exception");
}

- (void)test_genericTestCase_exceptionReasonContainsLocation
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
    XCTFail(@"Expected exception");
}

@end
