//
//  OCHamcrest - StringEndsWithTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCStringEndsWith.h>


static NSString* EXCERPT = @"EXCERPT";


@interface StringEndsWithTest : AbstractMatcherTest
@end

@implementation StringEndsWithTest

- (id<HCMatcher>) createMatcher
{
    return endsWith(@"irrelevant");
}


- (void) testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring
{
    id<HCMatcher> stringEndsWith = endsWith(EXCERPT);
    
    STAssertFalse([stringEndsWith matches:[EXCERPT stringByAppendingString:@"END"]],
                @"should be false if excerpt at beginning");
    STAssertTrue([stringEndsWith matches:[@"START" stringByAppendingString:EXCERPT]],
                @"should be true if excerpt at end");
    STAssertFalse([stringEndsWith matches:
                    [[@"START" stringByAppendingString:EXCERPT] stringByAppendingString:@"END"]],
                @"should be false if excerpt in middle");
    STAssertTrue([stringEndsWith matches:[EXCERPT stringByAppendingString:EXCERPT]],
                @"should be true if excerpt is at end and repeated");
    
    STAssertFalse([stringEndsWith matches:@"Something else"],
                @"should not be true if excerpt is not in string");
    STAssertFalse([stringEndsWith matches:[EXCERPT substringFromIndex:1]],
                @"should not be true if part of excerpt is at start of string");
}


- (void) testEvaluatesToTrueIfArgumentIsEqualToSubstring
{
    id<HCMatcher> stringEndsWith = endsWith(EXCERPT);
    
    STAssertTrue([stringEndsWith matches:EXCERPT],
                @"should be true if excerpt is entire string");
}


- (void) testConstructorRequiresNonNilArgument
{    
    STAssertThrows(endsWith(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a string ending with \"a\"", endsWith(@"a"));
}

@end
