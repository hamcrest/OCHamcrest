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
    return [[TestClass alloc] init];
}

@end

#pragma mark -

@interface ConformsToProtocolTest : AbstractMatcherTest
@end

@implementation ConformsToProtocolTest

- (id<HCMatcher>)createMatcher
{
    return conformsTo(@protocol(TestProtocol));
}

- (void)testEvaluatesToTrueIfArgumentConformsToASpecificProtocol
{
    TestClass *instance = [TestClass testClass];

    assertMatches(@"conforms to protocol", conformsTo(@protocol(TestProtocol)), instance);

    assertDoesNotMatch(@"does not conform to protocol", conformsTo(@protocol(TestProtocol)), @"hi");
    assertDoesNotMatch(@"nil", conformsTo(@protocol(TestProtocol)), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(conformsTo(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an object that conforms to TestProtocol", conformsTo(@protocol(TestProtocol)));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(conformsTo(@protocol(NSObject)), @"hi");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", conformsTo(@protocol(TestProtocol)), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", conformsTo(@protocol(TestProtocol)), @"bad");
}

@end
