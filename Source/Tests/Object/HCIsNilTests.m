//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsNil.h>

#import "MatcherTestCase.h"


@interface NilValueTests : MatcherTestCase
@end

@implementation NilValueTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = nilValue();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testEvaluatesToTrueIfArgumentIsNil
{
    assertMatches(@"nil", nilValue(), nil);
}

- (void)testEvaluatesToFalseIfArgumentIsNotNil
{
    id ANY_NON_NULL_ARGUMENT = [[NSObject alloc] init];

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


@interface NotNilValueTests : MatcherTestCase
@end

@implementation NotNilValueTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = notNilValue();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testEvaluatesToTrueIfArgumentIsNotNil
{
    id ANY_NON_NULL_ARGUMENT = [[NSObject alloc] init];

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

