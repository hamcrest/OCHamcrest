//
//  OCHamcrest - ConformsToProtocolTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Todd Farrell
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCConformsToProtocol.h>

    // Test support
#import "AbstractMatcherTest.h"


@protocol TestProtocol
@end

@interface TestClass : NSObject <TestProtocol>
@end

@implementation TestClass

+ (TestClass *)testClass
{
    return [[[TestClass alloc] init] autorelease];
}

@end

#pragma mark -

@interface ConformsToProtocolTest : AbstractMatcherTest
@end

@implementation ConformsToProtocolTest

- (id<HCMatcher>)createMatcher
{
    return conformsToProtocol(@protocol(TestProtocol));
}

- (void)testEvaluatesToTrueIfArgumentConformsToASpecificProtocol
{
    TestClass *instance = [TestClass testClass];

    assertMatches(@"conforms to protocol", conformsToProtocol(@protocol(TestProtocol)), instance);

    assertDoesNotMatch(@"does not conform to protocol", conformsToProtocol(@protocol(TestProtocol)), @"hi");
    assertDoesNotMatch(@"nil", conformsToProtocol(@protocol(TestProtocol)), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(conformsToProtocol(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an object that conforms to TestProtocol", conformsToProtocol(@protocol(TestProtocol)));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(conformsToProtocol(@protocol(NSObject)), @"hi");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", conformsToProtocol(@protocol(TestProtocol)), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", conformsToProtocol(@protocol(TestProtocol)), @"bad");
}

@end
