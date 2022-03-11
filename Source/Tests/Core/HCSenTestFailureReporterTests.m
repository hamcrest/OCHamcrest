//  OCHamcrest by Jon Reid, https://qualitycoding.org
//  Copyright 2022 hamcrest. See LICENSE.txt

#import <OCHamcrest/HCAssertThat.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCTestFailure.h>
#import <objc/runtime.h>

@import XCTest;


@interface NSException (OCHamcrest_SenTestFailure)

- (NSString *)filename;
- (NSNumber *)lineNumber;
- (NSString *)description;

+ (NSException *)failureInFile:(NSString *)filename atLine:(int)lineNumber withDescription:(NSString *)formatString, ...;

@end

@implementation NSException (OCHamcrest_SenTestFailure)

- (NSString *)filename
{
    return self.userInfo[@"filename"];
}

- (NSNumber *)lineNumber
{
    return self.userInfo[@"lineNumber"];
}

- (NSString *)description
{
    return self.userInfo[@"description"];
}

+ (NSException *)failureInFile:(NSString *)filename atLine:(int)lineNumber withDescription:(NSString *)formatString, ...
{
    return [self exceptionWithName:@"OCHamcrest_SenTestFailure" reason:nil userInfo:@{
            @"filename" : filename,
            @"lineNumber" : @(lineNumber),
            @"description" : [formatString stringByReplacingOccurrencesOfString:@"%%" withString:@"%"]
    }];
}

@end


// Used to swizzle XCTest failure reporters to not handle failure, so it will fall through to HCSenTestFailureReporter.
static BOOL doNotHandleFailure(id self, SEL _cmd, HCTestFailure *failure)
{
    return NO;
}

@interface HCSenTestFailureReporterTests : XCTestCase
@property (nonatomic, copy) NSString *failureDescription;
@property (nonatomic, copy) NSString *failureFile;
@property (nonatomic, assign) NSUInteger failureLine;
@end

@implementation HCSenTestFailureReporterTests
{
    Class XCTestIssueFailureReporterClass;
    Class XCTestFailureReporterClass;
    SEL doNotHandleFailureSelector;
}

- (void)setUp
{
    [super setUp];
    XCTestIssueFailureReporterClass = NSClassFromString(@"HCXCTestIssueFailureReporter");
    XCTestFailureReporterClass = NSClassFromString(@"HCXCTestFailureReporter");
    doNotHandleFailureSelector = NSSelectorFromString(@"doNotHandleFailure:");
    [self addDoNotHandleFailureMethodTo:XCTestIssueFailureReporterClass];
    [self addDoNotHandleFailureMethodTo:XCTestFailureReporterClass];
    [self swizzleFailureReporter:XCTestIssueFailureReporterClass];
    [self swizzleFailureReporter:XCTestFailureReporterClass];
}

- (void)tearDown
{
    [self swizzleFailureReporter:XCTestIssueFailureReporterClass];
    [self swizzleFailureReporter:XCTestFailureReporterClass];
    [super tearDown];
}

- (void)addDoNotHandleFailureMethodTo:(Class)testReporterClass
{
    if (![testReporterClass instancesRespondToSelector:doNotHandleFailureSelector])
    {
        BOOL success = class_addMethod(
                testReporterClass,
                doNotHandleFailureSelector,
                (IMP)doNotHandleFailure,
                "c@:@");
        XCTAssertTrue(success);
    }
}

- (void)swizzleFailureReporter:(Class)testReporterClass
{
    Method originalMethod = class_getInstanceMethod(testReporterClass, NSSelectorFromString(@"willHandleFailure:"));
    Method swizzledMethod = class_getInstanceMethod(testReporterClass, doNotHandleFailureSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)failWithException:(NSException *)exception
{
    XCTAssertEqualObjects(exception.name, @"OCHamcrest_SenTestFailure");
    self.failureDescription = exception.userInfo[@"description"];
    self.failureFile = exception.userInfo[@"filename"];
    self.failureLine = [exception.userInfo[@"lineNumber"] unsignedIntegerValue];
}

- (void)testSuccessfulMatch_ShouldBeSilent
{
    assertThat(@"foo", equalTo(@"foo"));

    XCTAssertNil(self.failureDescription);
}

- (void)testOCUnitAssertionError_ShouldDescribeExpectedAndActual
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    assertThat(actual, equalTo(expected));

    XCTAssertEqualObjects(self.failureDescription, expectedMessage);
}

- (void)testOCUnitAssertionError_ShouldCorrectlyDescribeStringsWithPercentSymbols
{
    NSString *expected = @"%s";
    NSString *actual = @"%d";
    NSString *expectedMessage = @"Expected \"%s\", but was \"%d\"";

    assertThat(actual, equalTo(expected));
    
    XCTAssertEqualObjects(self.failureDescription, expectedMessage);
}

@end
