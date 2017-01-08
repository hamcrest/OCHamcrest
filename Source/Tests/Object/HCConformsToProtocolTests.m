//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt
//  Contribution by Todd Farrell

#import <OCHamcrest/HCConformsToProtocol.h>

#import "MatcherTestCase.h"


@protocol TestProtocol
@end

@interface TestClass : NSObject <TestProtocol>
@end

@implementation TestClass

+ (instancetype)testClass
{
    return [[TestClass alloc] init];
}

@end

@interface ConformsToTests : MatcherTestCase
@end

@implementation ConformsToTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = conformsTo(@protocol(TestProtocol));

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(conformsTo(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
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
