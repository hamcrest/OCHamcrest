//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCTestFailureReporterChain.h>
#import <OCHamcrest/HCTestFailureHandlerChain.h>

#import <SenTestingKit/SenTestingKit.h>


@interface TestFailureReporterChainTests : SenTestCase
@end

@implementation TestFailureReporterChainTests

- (void)tearDown
{
    [HCTestFailureReporterChain reset];
    [super tearDown];
}

- (void)testDefaultChain_ShouldPointToXCTestHandlerAsHeadOfChain
{
    HCTestFailureReporter *chain = [HCTestFailureReporterChain reporterChain];

    STAssertEqualObjects(NSStringFromClass([chain class]), @"HCXCTestFailureReporter", nil);
    STAssertNotNil(chain.successor, nil);
}

- (void)testDeprecatedFunction_ShouldPointToXCTestHandlerAsHeadOfChain
{
    HCTestFailureHandler *handler = HC_testFailureHandlerChain();

    STAssertEqualObjects(NSStringFromClass([handler class]), @"HCXCTestFailureReporter", nil);
    STAssertNotNil(handler.successor, nil);
}

- (void)testAddReporter_ShouldSetHeadOfChainToGivenHandler
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addReporter:reporter];

    STAssertEquals([HCTestFailureReporterChain reporterChain], reporter, nil);
}

- (void)testAddReporter_ShouldSetHandlerSuccessorToPreviousHeadOfChain
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];
    HCTestFailureReporter *oldHead = [HCTestFailureReporterChain reporterChain];
    
    [HCTestFailureReporterChain addReporter:reporter];
    
    STAssertEquals(reporter.successor, oldHead, nil);
}

- (void)testAddReporter_ShouldSetHandlerSuccessorEvenIfHeadOfChainHasNotBeenReferenced
{
    HCTestFailureReporter *reporter = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addReporter:reporter];

    STAssertNotNil(reporter.successor, nil);
}

@end
