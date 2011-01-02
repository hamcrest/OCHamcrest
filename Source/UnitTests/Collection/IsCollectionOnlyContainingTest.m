//
//  OCHamcrest - IsCollectionOnlyContainingTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionOnlyContaining.h>
#import <OCHamcrest/HCIsEqual.h>


@interface IsCollectionOnlyContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionOnlyContainingTest

- (id<HCMatcher>) createMatcher
{
    return onlyContains(equalTo(@"irrelevant"), nil);
}


- (void) testDoesNotMatchEmptyCollection
{
    assertDoesNotMatch(@"empty collection",
                       onlyContains(equalTo(@"foo"), nil),
                       ([NSArray array]));
}


- (void) testMatchesSingletonCollection
{
    assertMatches(@"singleton collection",
                  onlyContains(equalTo(@"a"), nil),
                  ([NSSet setWithObject:@"a"]));
}


- (void) testMatchesCollection
{
    assertMatches(@"collection",
                  onlyContains(equalTo(@"a"), equalTo(@"b"), nil),
                  ([NSSet setWithObjects:@"a", @"b", nil]));
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    assertMatches(@"collection",
                  onlyContains(@"a", equalTo(@"b"), nil),
                  ([NSSet setWithObjects:@"a", @"b", nil]));
}


- (void) testDoesNotMatchCollectionWithMismatchingItem
{
    assertDoesNotMatch(@"collection",
                       onlyContains(@"a", @"b", nil),
                       ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a collection containing items matching (\"a\" or \"b\")",
                        onlyContains(@"a", @"b", nil));

}


- (void) testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(onlyContains(nil), @"Should require non-nil list");
}

@end
