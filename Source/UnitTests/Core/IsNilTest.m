//
//  OCHamcrest - IsNilTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsNil.h>
#import <OCHamcrest/HCIsNot.h>


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

//==================================================================================================

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

