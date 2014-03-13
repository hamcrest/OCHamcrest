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

    // Test support
#import "AbstractMatcherTest.h"


@interface ThrowsExceptionTest : AbstractMatcherTest

- (id)throwInvalidArgumentException;
- (id)doNotThrowException;

@end

@implementation ThrowsExceptionTest

- (id)throwInvalidArgumentException
{
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"For fun." userInfo:nil];
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

@end
