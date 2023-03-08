// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCXCTestIssueFailureReporter.h"

#import "HCTestFailure.h"


@class XCTAttachment, XCTIssue, XCTSourceCodeContext, XCTSourceCodeLocation;

@interface NSObject (PretendMethodsExistOnNSObjectToAvoidLinkingXCTest)

- (void)recordIssue:(XCTIssue *)issue;
- (instancetype)initWithFilePath:(NSString *)filePath lineNumber:(NSInteger)lineNumber;
- (instancetype)initWithLocation:(nullable XCTSourceCodeLocation *)location;
- (instancetype)initWithType:(NSInteger)type
          compactDescription:(NSString *)compactDescription
         detailedDescription:(nullable NSString *)detailedDescription
           sourceCodeContext:(XCTSourceCodeContext *)sourceCodeContext
             associatedError:(nullable NSError *)associatedError
                 attachments:(NSArray<XCTAttachment *> *)attachments;
@end


@implementation HCXCTestIssueFailureReporter

- (BOOL)willHandleFailure:(HCTestFailure *)failure
{
    return [failure.testCase respondsToSelector:@selector(recordIssue:)];
}

- (void)executeHandlingOfFailure:(HCTestFailure *)failure
{
    Class XCTSourceCodeLocationClass = NSClassFromString(@"XCTSourceCodeLocation");
    id location =
            [[XCTSourceCodeLocationClass alloc]
                    initWithFilePath:failure.fileName
                          lineNumber:(NSInteger)failure.lineNumber];
    
    Class XCTSourceCodeContextClass = NSClassFromString(@"XCTSourceCodeContext");
    id sourceCodeContext = [[XCTSourceCodeContextClass alloc] initWithLocation:location];
    
    Class XCTIssueClass = NSClassFromString(@"XCTIssue");
    id issue =
            [[XCTIssueClass alloc]
                    initWithType:0 // XCTIssueTypeAssertionFailure
              compactDescription:failure.reason
             detailedDescription:nil
               sourceCodeContext:sourceCodeContext
                 associatedError:nil
                     attachments:[NSArray array]];
    
    [failure.testCase recordIssue:issue];
}

@end
