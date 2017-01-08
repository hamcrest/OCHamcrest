//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCTestFailureReporterChain.h>

#import <OCHamcrest/HCTestFailureReporter.h>

#import <XCTest/XCTest.h>


@interface HCTestFailureReporterChainTests : XCTestCase
@end

@implementation HCTestFailureReporterChainTests

- (void)tearDown
{
    [HCTestFailureReporterChain reset];
    [super tearDown];
}

- (void)testDefaultChain_ShouldPointToXCTestHandlerAsHeadOfChain
{
    HCTestFailureReporter *chain = [HCTestFailureReporterChain reporterChain];

    XCTAssertEqualObjects(NSStringFromClass([chain class]), @"HCXCTestFailureReporter");
    XCTAssertNotNil(chain.successor);
}

- (void)testAddReporter_ShouldSetHeadOfChainToGivenHandler
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addReporter:reporter];

    XCTAssertEqual([HCTestFailureReporterChain reporterChain], reporter);
}

- (void)testAddReporter_ShouldSetHandlerSuccessorToPreviousHeadOfChain
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];
    HCTestFailureReporter *oldHead = [HCTestFailureReporterChain reporterChain];
    
    [HCTestFailureReporterChain addReporter:reporter];
    
    XCTAssertEqual(reporter.successor, oldHead);
}

- (void)testAddReporter_ShouldSetHandlerSuccessorEvenIfHeadOfChainHasNotBeenReferenced
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addReporter:reporter];

    XCTAssertNotNil(reporter.successor);
}

@end
