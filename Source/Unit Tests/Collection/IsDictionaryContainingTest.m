//
//  OCHamcrest - IsDictionaryContainingTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsDictionaryContaining.h>
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsDictionaryContainingTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingTest

- (id<HCMatcher>) createMatcher
{
    return hasEntry(@"irrelevant", @"irrelevant");
}


- (void) testMatchesMapContainingMatchingKeyAndValue
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            nil];

    assertMatches(@"matcherA", hasEntry(equalTo(@"a"), equalTo(@"1")), dict);
    assertMatches(@"matcherB", hasEntry(equalTo(@"b"), equalTo(@"2")), dict);
    assertDoesNotMatch(@"matcherC", hasEntry(equalTo(@"c"), equalTo(@"3")), dict);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            nil];

    assertMatches(@"matcherA", hasEntry(@"a", equalTo(@"1")), dict);
    assertMatches(@"matcherB", hasEntry(equalTo(@"b"), @"2"), dict);
    assertDoesNotMatch(@"matcherC", hasEntry(@"c", @"3"), dict);
}


- (void) testDoesNotMatchNil
{
    assertDoesNotMatch(@"should not match nil",
            hasEntry(anything(), anything()), nil);
}


- (void) testHasReadableDescription
{
    assertDescription(@"dictionary containing [\"a\"-><2>]",
            hasEntry(equalTo(@"a"), equalTo([NSNumber numberWithInt:2])));
}

@end
