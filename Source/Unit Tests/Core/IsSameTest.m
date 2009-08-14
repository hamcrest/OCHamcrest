//
//  OCHamcrest - IsSameTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsSame.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>
#import <OCHamcrest/HCStringDescription.h>


@interface IsSameTest : AbstractMatcherTest
@end

@implementation IsSameTest

- (id<HCMatcher>) createMatcher
{
    return sameInstance(@"irrelevant");
}


- (void) testEvaluatesToTrueIfArgumentIsReferenceToASpecifiedObject
{
    id o1 = [[[NSObject alloc] init] autorelease];
    id o2 = [[[NSObject alloc] init] autorelease];

    assertThat(o1, sameInstance(o1));
    assertThat(o2, isNot(sameInstance(o1)));
}


- (void) testReturnsReadableDescriptionFromToString
{
    assertDescription(@"sameInstance(\"ARG\")", sameInstance(@"ARG"));
}


- (void) testDescribeMismatch
{
    id s1 = [NSString stringWithString:@"foo"];
    id s2 = [NSString stringWithString:@"foo"];
    id<HCMatcher> matcher = sameInstance(s1);
    HCStringDescription* description = [HCStringDescription stringDescription];
    
    [matcher describeMismatchOf:s2 to:description];
    NSString* expected = @"was \"foo\": 0x";
    STAssertEqualObjects(expected, [[description description] substringToIndex:[expected length]], nil);
}

@end
