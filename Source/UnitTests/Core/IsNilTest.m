//
//  OCHamcrest - IsNilTest.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsNil.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


@interface IsNilTest : AbstractMatcherTest
@end

@implementation IsNilTest

- (id<HCMatcher>) createMatcher
{
    return nilValue();
}


- (void) testEvaluatesToTrueIfArgumentIsNil
{
    id ANY_NON_NULL_ARGUMENT = [[[NSObject alloc] init] autorelease];
    
    assertThat(nil, nilValue());
    assertThat(ANY_NON_NULL_ARGUMENT, isNot(nilValue()));

    assertThat(ANY_NON_NULL_ARGUMENT, notNilValue());
    assertThat(nil, isNot(notNilValue()));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"nil", nilValue());
    assertDescription(@"not nil", notNilValue());
}

@end
