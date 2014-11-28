//
//  OCHamcrest - IsCollectionOnlyContainingTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
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
#import "Mismatchable.h"


@interface IsCollectionOnlyContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionOnlyContainingTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = onlyContains(equalTo(@"irrelevant"), nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testDoesNotMatchEmptyCollection
{
    id matcher = onlyContains(equalTo(@"irrelevant"), nil);

    assertMismatchDescription(@"was empty", matcher, @[]);
}

- (void)testReportAllElementsThatDoNotMatch
{
    id matcher = onlyContains([Mismatchable mismatchable:@"a"], nil);

    assertMismatchDescription(@"mismatches were: [was \"b\", was \"c\"]", matcher, (@[@"b", @"a", @"c"]));
}

- (void)testDoesNotMatchNonCollection
{
    id matcher = onlyContains(equalTo(@"irrelevant"), nil);

    assertMismatchDescription(@"was non-collection nil", matcher, nil);
}

- (void)testMatchesSingletonCollection
{
    assertMatches(@"singleton collection",
                  onlyContains(equalTo(@"a"), nil),
                  [NSSet setWithObject:@"a"]);
}

- (void)testMatchesAllItemsWithOneMatcher
{
    assertMatches(@"one matcher",
                  onlyContains(lessThan(@"d"), nil),
                  (@[@"a", @"b", @"c"]));
}

- (void)testMatchesAllItemsWithMultipleMatchers
{
    assertMatches(@"multiple matcher",
                  onlyContains(lessThan(@"d"), equalTo(@"hi"), nil),
                  (@[@"a", @"hi", @"b", @"c"]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equal_to",
                  onlyContains(lessThan(@"d"), @"hi", nil),
                  (@[@"a", @"hi", @"b", @"c"]));
}

- (void)testDoesNotMatchCollectionWithMismatchingItem
{
    assertDoesNotMatch(@"d is not less than d",
                       onlyContains(lessThan(@"d"), nil),
                       (@[@"b", @"c", @"d"]));
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

@end
