//
//  OCHamcrest - ThrowsExceptionTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

    // Class under test
#define HC_SHORTHAND
#import "HCThrowsException.h"
#import "HCAssertThat.h"
#import "HCAllOf.h"
#import "HCStringContains.h"
#import "HCIsEqual.h"

    // Test support
#import "AbstractMatcherTest.h"


@interface ThrowsExceptionTest : AbstractMatcherTest

- (id)returnInvalidArgumentException;
- (id)throwInvalidArgumentException;
- (id)doNotThrowException;

@end

@implementation ThrowsExceptionTest

- (id)returnInvalidArgumentException
{
    return [NSException exceptionWithName:NSInvalidArgumentException reason:@"For fun." userInfo:nil];
}

- (id)throwInvalidArgumentException
{
    @throw [self returnInvalidArgumentException];
}

- (id)doNotThrowException
{
    return @"abc";
}

- (void)testEvaluatesToTrueIfArgumentThrowsAnyExceptionWhenExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertMatches(@"", willThrowException(), exceptionCatcher());
}

- (void)testEvaluatesToTrueIfArgumentDoesNotThrowExceptionWhenNotExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self doNotThrowException]);
    assertMatches(@"", willNotThrowException(), exceptionCatcher());
}

- (void)testEvaluatesToFalseIfArgumentThrowsAnyExceptionWhenNotExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertDoesNotMatch(@"", willNotThrowException(), exceptionCatcher());
}

- (void)testEvaluatesToFalseIfArgumentDoesNotThrowExceptionWhenExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self doNotThrowException]);
    assertDoesNotMatch(@"", willThrowException(), exceptionCatcher());
}

- (void)testReturningAnExceptionWillNotTriggerExceptionCatch
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self returnInvalidArgumentException]);
    assertDoesNotMatch(@"", willThrowException(), exceptionCatcher());
}

- (void)testHasAReadableDescriptionForExpected
{
    assertDescription(@"will throw exception", willThrowException());
}

- (void)testHasAReadableDescriptionForNotExpected
{
    assertDescription(@"will not throw exception", willNotThrowException());
}

- (void)testDescribeMismatchOfThrowExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertDescribeMismatch(@"was <NSInvalidArgumentException: For fun.>", willThrowException(), exceptionCatcher());
}

- (void)testDescribeMismatchOfThrowNotExpected
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertDescribeMismatch(@"was <NSInvalidArgumentException: For fun.>", willNotThrowException(), exceptionCatcher());
}

- (void)testMismatchDescriptionShowsActualArgument
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertMismatchDescription(@"was <NSInvalidArgumentException: For fun.>", willNotThrowException(), exceptionCatcher());
}

- (void)testExceptionMessageCanBeUsedInConjunctionWithStringMatchers
{
    assertThat([self throwInvalidArgumentException], containsString(@"fun"));
}

- (void)testExceptionWithMessageCanBeUsedInConjunctionWithEqualityMatchers
{
    assertThat([self throwInvalidArgumentException], equalTo(@"NSInvalidArgumentException: For fun."));
}

- (void)testEvaluatesToTrueIfArgumentThrowsExceptionOfSpecificExpectedType
{
    id (^exceptionCatcher)() = HC_buildExceptionCatcher([self throwInvalidArgumentException]);
    assertMatches(@"", willThrow(@"NSInvalidArgumentException"), exceptionCatcher());
}

//~ testEvaluatesToFalseIfArgumentThrowsExceptionOfSpecificTypeThatDiffersFromExpected

//~ testExceptionCatcherWhenMethodReturnsVoid

@end
