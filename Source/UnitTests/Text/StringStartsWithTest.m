//
//  OCHamcrest - StringStartsWithTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCStringStartsWith.h>


static NSString* EXCERPT = @"EXCERPT";


@interface StringStartsWithTest : AbstractMatcherTest
@end

@implementation StringStartsWithTest

- (id<HCMatcher>) createMatcher
{
    return startsWith(@"irrelevant");
}


- (void) testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring
{
    id<HCMatcher> stringStartsWith = startsWith(EXCERPT);
    
    STAssertTrue([stringStartsWith matches:[EXCERPT stringByAppendingString:@"END"]],
                 @"should be true if excerpt at beginning");
    STAssertFalse([stringStartsWith matches:[@"START" stringByAppendingString:EXCERPT]],
                  @"should be false if excerpt at end");
    STAssertFalse([stringStartsWith matches:
                    [[@"START" stringByAppendingString:EXCERPT] stringByAppendingString:@"END"]],
                  @"should be false if excerpt in middle");
    STAssertTrue([stringStartsWith matches:[EXCERPT stringByAppendingString:EXCERPT]],
                 @"should be true if excerpt is at beginning and repeated");
    
    STAssertFalse([stringStartsWith matches:@"Something else"],
                  @"should not be true if excerpt is not in string");
    STAssertFalse([stringStartsWith matches:[EXCERPT substringFromIndex:1]],
                  @"should not be true if part of excerpt is at start of string");
}


- (void) testEvaluatesToTrueIfArgumentIsEqualToSubstring
{
    id<HCMatcher> stringStartsWith = startsWith(EXCERPT);
    
    STAssertTrue([stringStartsWith matches:EXCERPT],
                 @"should be true if excerpt is entire string");
}


- (void) testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(startsWith(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a string starting with \"a\"", startsWith(@"a"));
}

@end
