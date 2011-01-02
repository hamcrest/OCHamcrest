//
//  OCHamcrest - IsDictionaryContainingKeyTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContainingKey.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsDictionaryContainingKeyTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingKeyTest

- (id<HCMatcher>) createMatcher
{
    return hasKey(@"irrelevant");
}


- (void) testMatchesSingletonDictionaryContainingKey
{
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    
    assertMatches(@"Matches single key", hasKey(equalTo(@"a")), dict);
}


- (void) testMatchesDictionaryContainingKey
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertMatches(@"Matches a", hasKey(equalTo(@"a")), dict);
    assertMatches(@"Matches c", hasKey(equalTo(@"c")), dict);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];

    assertMatches(@"Matches c", hasKey(@"c"), dict);
}


- (void) testHasReadableDescription
{
    assertDescription(@"dictionary with key \"a\"", hasKey(@"a"));
}


- (void) testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"Empty dictionary", hasKey(@"Foo"), [NSDictionary dictionary]);
}


- (void) testDoesNotMatchDictionaryMissingKey
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertDoesNotMatch(@"Dictionary without matching key", hasKey(@"d"), dict);
}


- (void) testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(hasKey(nil), @"Should require non-nil argument");
}

@end
