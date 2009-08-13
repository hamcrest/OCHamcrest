//
//  UnitTests - IsInstanceOfTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsInstanceOf.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


@interface IsInstanceOfTest : AbstractMatcherTest
@end

@implementation IsInstanceOfTest

- (id<HCMatcher>) createMatcher
{
    return instanceOf([NSNumber class]);
}


- (void) testEvaluatesToTrueIfArgumentIsInstanceOfASpecificClass
{
    NSNumber* number = [NSNumber numberWithInt:1];
    assertThat(number, instanceOf([NSNumber class]));
    assertThat(number, instanceOf([NSValue class]));
    assertThat(nil, isNot(instanceOf([NSNumber class])));
    assertThat(@"hello", isNot(instanceOf([NSNumber class])));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"an instance of NSNumber", instanceOf([NSNumber class]));
}

@end
