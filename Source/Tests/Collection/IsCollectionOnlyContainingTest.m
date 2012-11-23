//
//  OCHamcrest - IsCollectionOnlyContainingTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsCollectionOnlyContaining.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCOrderingComparison.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsCollectionOnlyContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionOnlyContainingTest

- (id<HCMatcher>)createMatcher
{
    return onlyContains(equalTo(@"irrelevant"), nil);
}

- (void)testMatchesSingletonCollection
{
    assertMatches(@"singleton collection",
                  onlyContains(equalTo(@"a"), nil),
                  ([NSSet setWithObject:@"a"]));
}

- (void)testMatchesAllItemsWithOneMatcher
{
    assertMatches(@"one matcher",
                  onlyContains(lessThan(@"d"), nil),
                  ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}

- (void)testMatchesAllItemsWithMultipleMatchers
{
    assertMatches(@"multiple matcher",
                  onlyContains(lessThan(@"d"), equalTo(@"hi"), nil),
                  ([NSArray arrayWithObjects:@"a", @"hi", @"b", @"c", nil]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equal_to",
                  onlyContains(lessThan(@"d"), @"hi", nil),
                  ([NSArray arrayWithObjects:@"a", @"hi", @"b", @"c", nil]));
}

- (void)testDoesNotMatchCollectionWithMismatchingItem
{
    assertDoesNotMatch(@"d is not less than d",
                       onlyContains(lessThan(@"d"), nil),
                       ([NSArray arrayWithObjects:@"b", @"c", @"d", nil]));
}

- (void)testDoesNotMatchEmptyCollection
{
    assertDoesNotMatch(@"empty collection", onlyContains(equalTo(@"foo"), nil), (@[]));
}

- (void)testMatcherCreationRequiresNonNilArgument
{    
    STAssertThrows(onlyContains(nil), @"Should require non-nil list");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing items matching (\"a\" or \"b\")",
                        onlyContains(@"a", @"b", nil));

}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", (onlyContains(@"a", @"b", nil)), @"bad");
}

- (void)testDescribeMismatchOfNonCollection
{
    assertDescribeMismatch(@"was nil", (onlyContains(@"a", @"b", nil)), nil);
}

@end
