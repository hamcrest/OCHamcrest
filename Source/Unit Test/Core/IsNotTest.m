//
//  UnitTests - IsNotTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsNotTest : AbstractMatcherTest
@end

@implementation IsNotTest

- (id<HCMatcher>) createMatcher
{
    return isNot(@"something");
}


- (void) testEvaluatesToTheTheLogicalNegationOfAnotherMatcher
{
    assertMatches(@"should match", isNot(equalTo(@"A")), @"B");
    assertDoesNotMatch(@"should not match", isNot(equalTo(@"B")), @"B");
}


- (void) testProvidesConvenientShortcutForNotEqualTo
{
    assertMatches(@"should match", isNot(@"A"), @"B");
    assertMatches(@"should match", isNot(@"B"), @"A");
    assertDoesNotMatch(@"should not match", isNot(@"A"), @"A");
    assertDoesNotMatch(@"should not match", isNot(@"B"), @"B");
    assertDescription(@"not \"A\"", isNot(@"A"));
}

@end
