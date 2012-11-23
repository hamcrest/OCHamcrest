//
//  OCHamcrest - IsInstanceOfTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsInstanceOf.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsInstanceOfTest : AbstractMatcherTest
@end

@implementation IsInstanceOfTest

- (id<HCMatcher>)createMatcher
{
    return instanceOf([NSNumber class]);
}

- (void)testEvaluatesToTrueIfArgumentIsInstanceOfASpecificClass
{
    NSNumber *number = @1;

    assertMatches(@"same class", instanceOf([NSNumber class]), number);
    assertMatches(@"subclass", instanceOf([NSValue class]), number);

    assertDoesNotMatch(@"different class", instanceOf([NSNumber class]), @"hi");
    assertDoesNotMatch(@"nil", instanceOf([NSNumber class]), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(instanceOf(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an instance of NSNumber", instanceOf([NSNumber class]));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(instanceOf([NSString class]), @"hi");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", instanceOf([NSNumber class]), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", instanceOf([NSNumber class]), @"bad");
}

@end
