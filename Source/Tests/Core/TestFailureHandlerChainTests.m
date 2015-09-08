//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureReporterChain.h"
#import "HCTestFailureHandlerChain.h"

#import "HCTestFailureReporter.h"

#import <SenTestingKit/SenTestingKit.h>


@interface TestFailureHandlerChainTests : SenTestCase
@end

@implementation TestFailureHandlerChainTests

- (void)tearDown
{
    [HCTestFailureReporterChain reset];
    [super tearDown];
}

- (void)testDefaultChain_ShouldPointToXCTestHandlerAsHeadOfChain
{
    HCTestFailureReporter *chain = [HCTestFailureReporterChain chain];

    STAssertEqualObjects(NSStringFromClass([chain class]), @"HCXCTestFailureReporter", nil);
    STAssertNotNil(chain.successor, nil);
}

- (void)testDeprecatedFunction_ShouldPointToXCTestHandlerAsHeadOfChain
{
    HCTestFailureHandler *handler = HC_testFailureHandlerChain();

    STAssertEqualObjects(NSStringFromClass([handler class]), @"HCXCTestFailureReporter", nil);
    STAssertNotNil(handler.successor, nil);
}

- (void)testAddHandler_ShouldSetHeadOfChainToGivenHandler
{
    HCTestFailureReporter *newHandler = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addHandler:newHandler];

    STAssertEquals([HCTestFailureReporterChain chain], newHandler, nil);
}

- (void)testAddHandler_ShouldSetHandlerSuccessorToPreviousHeadOfChain
{
    HCTestFailureReporter *newHandler = [[HCTestFailureReporter alloc] init];
    HCTestFailureReporter *oldHead = [HCTestFailureReporterChain chain];
    
    [HCTestFailureReporterChain addHandler:newHandler];
    
    STAssertEquals(newHandler.successor, oldHead, nil);
}

- (void)testAddHandler_ShouldSetHandlerSuccessorEvenIfHeadOfChainHasNotBeenReferenced
{
    HCTestFailureReporter *newHandler = [[HCTestFailureReporter alloc] init];

    [HCTestFailureReporterChain addHandler:newHandler];

    STAssertNotNil(newHandler.successor, nil);
}

@end
