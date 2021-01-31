//  OCHamcrest by Jon Reid, https://qualitycoding.org
//  Copyright 2021 hamcrest. See LICENSE.txt

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
                     attachments:[[NSArray alloc] init]];
    
    [failure.testCase recordIssue:issue];
}

@end
