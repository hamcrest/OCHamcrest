//
//  UnitTests - StringContainsTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCStringContains.h>


static NSString* EXCERPT = @"EXCERPT";


@interface StringContainsTest : AbstractMatcherTest
@end

@implementation StringContainsTest

- (id<HCMatcher>) createMatcher
{
    return containsString(@"irrelevant");
}


- (void) testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring
{
    id<HCMatcher> stringContains = containsString(EXCERPT);
    
    STAssertTrue([stringContains matches:[EXCERPT stringByAppendingString:@"END"]],
                @"should be true if excerpt at beginning");
    STAssertTrue([stringContains matches:[@"START" stringByAppendingString:EXCERPT]],
                @"should be true if excerpt at end");
    STAssertTrue([stringContains matches:
                    [[@"START" stringByAppendingString:EXCERPT] stringByAppendingString:@"END"]],
                @"should be true if excerpt in middle");
    STAssertTrue([stringContains matches:[EXCERPT stringByAppendingString:EXCERPT]],
                @"should be true if excerpt is repeated");
    
    STAssertFalse([stringContains matches:@"Something else"],
                @"should not be true if excerpt is not in string");
    STAssertFalse([stringContains matches:[EXCERPT substringFromIndex:1]],
                @"should not be true if part of excerpt is in string");
}


- (void) testEvaluatesToTrueIfArgumentIsEqualToSubstring
{
    id<HCMatcher> stringContains = containsString(EXCERPT);
    
    STAssertTrue([stringContains matches:EXCERPT],
                @"should be true if excerpt is entire string");
}


- (void) testConstructorRequiresNonNilArgument
{    
    STAssertThrows(containsString(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a string containing \"a\"", containsString(@"a"));
}

@end
