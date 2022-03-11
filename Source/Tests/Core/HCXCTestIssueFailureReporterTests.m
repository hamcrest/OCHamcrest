//  OCHamcrest by Jon Reid, https://qualitycoding.org
//  Copyright 2022 hamcrest. See LICENSE.txt

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

- (void)testXCTestCase_WithMatch_ShouldNotRecordFailure
{
    self.interceptFailure = YES;
    assertThat(@0, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqual(self.failureCount, 0U);
}

- (void)testXCTestCase_WithMismatch_ShouldRecordFailure
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqual(self.failureCount, 1U);
}

- (void)testXCTestCase_WithMismatch_ShouldRecordFailureWithMismatchDescription
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    
    self.interceptFailure = YES;
    assertThat(actual, equalTo(expected));
    self.interceptFailure = NO;
    
    XCTAssertEqualObjects(expectedMessage, self.failureDescription);
}

- (void)testXCTestCase_WithMismatch_ShouldRecordFailureWithCurrentFileName
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;
    
    XCTAssertEqualObjects(
            [NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding],
            self.failureFile);
}

- (void)testXCTestCase_WithMismatch_ShouldRecordFailureWithCurrentLineNumber
{
    self.interceptFailure = YES;
    NSInteger assertLine = __LINE__ + 1;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;

    XCTAssertEqual(self.failureLine, assertLine);
}

- (void)testXCTestCase_WithMismatch_ShouldRecordAssertionFailure
{
    self.interceptFailure = YES;
    assertThat(@1, equalTo(@0));
    self.interceptFailure = NO;

    XCTAssertEqual(self.failureType, XCTIssueTypeAssertionFailure);
}

@end
