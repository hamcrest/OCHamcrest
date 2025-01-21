// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCAssertThat.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCTestFailure.h>
#import <objc/runtime.h>

@import XCTest;


@interface HCXCTestIssueFailureReporterTests : XCTestCase
@property (nonatomic, assign) BOOL interceptFailure;
@property (nonatomic, assign) NSUInteger failureCount;
@property (nonatomic, copy) NSString *failureDescription;
@property (nonatomic, copy) NSString *failureFile;
@property (nonatomic, assign) NSInteger failureLine;
@property (nonatomic, assign) XCTIssueType failureType;
@end

@implementation HCXCTestIssueFailureReporterTests

- (void)recordIssue:(XCTIssue *)issue
{
    if (!self.interceptFailure)
        [super recordIssue:issue];
    else
    {
        self.failureCount += 1;
        self.failureDescription = issue.compactDescription;
        self.failureFile = issue.sourceCodeContext.location.fileURL.path;
        self.failureLine = issue.sourceCodeContext.location.lineNumber;
        self.failureType = issue.type;
    }
}

- (void)test_XCTestCase_withMatch_shouldNotRecordFailure
{
    self.interceptFailure = YES;
    assertThat(@0, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqual(self.failureCount, 0U);
}

- (void)test_XCTestCase_withMismatch_shouldRecordFailure
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqual(self.failureCount, 1U);
}

- (void)test_XCTestCase_withMismatch_shouldRecordFailureWithMismatchDescription
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    
    self.interceptFailure = YES;
    assertThat(actual, equalTo(expected));
    self.interceptFailure = NO;
    
    XCTAssertEqualObjects(expectedMessage, self.failureDescription);
}

- (void)test_XCTestCase_withMismatch_shouldRecordFailureWithCurrentFileName
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqualObjects(
            [NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding],
            self.failureFile);
}

- (void)test_XCTestCase_withMismatch_shouldRecordFailureWithCurrentLineNumber
{
    self.interceptFailure = YES;
    NSInteger assertLine = __LINE__ + 1;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;

    XCTAssertEqual(self.failureLine, assertLine);
}

- (void)test_XCTestCase_withMismatch_shouldRecordAssertionFailure
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;

    XCTAssertEqual(self.failureType, XCTIssueTypeAssertionFailure);
}

@end
