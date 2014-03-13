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

@end

@implementation ThrowsExceptionTest

- (id)throwInvalidArgumentException
{
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"For fun." userInfo:nil];
}

- (void)testEvaluatesToTrueIfArgumentThrowsAnyException
{
    assertThat([self throwInvalidArgumentException], throwsException());
}

@end
