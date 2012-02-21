//
//  OCHamcrest - IsNilTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsNil.h>

    // Collaborators
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsNot.h>

    // Test support
#import "AbstractMatcherTest.h"



@interface IsNilTest : AbstractMatcherTest
@end

@implementation IsNilTest

- (id<HCMatcher>)createMatcher
{
    return nilValue();
}

- (void)testEvaluatesToTrueIfArgumentIsNil
{
    assertMatches(@"nil", nilValue(), nil);
}

- (void)testEvaluatesToFalseIfArgumentIsNotNil
{
    id ANY_NON_NULL_ARGUMENT = [[[NSObject alloc] init] autorelease];

    assertDoesNotMatch(@"not nil", nilValue(), ANY_NON_NULL_ARGUMENT);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"nil", nilValue());
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(nilValue(), nil);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", nilValue(), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", nilValue(), @"bad");
}

@end


#pragma mark -

@interface NotNilTest : AbstractMatcherTest
@end

@implementation NotNilTest

- (id<HCMatcher>)createMatcher
{
    return notNilValue();
}

- (void)testEvaluatesToTrueIfArgumentIsNotNil
{
    id ANY_NON_NULL_ARGUMENT = [[[NSObject alloc] init] autorelease];

    assertMatches(@"not nil", notNilValue(), ANY_NON_NULL_ARGUMENT);
}

- (void)testEvaluatesToFalseIfArgumentIsNil
{
    assertDoesNotMatch(@"nil", notNilValue(), nil);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"not nil", notNilValue());
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(notNilValue(), @"hi");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was nil", notNilValue(), nil);
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was nil", notNilValue(), nil);
}

@end

