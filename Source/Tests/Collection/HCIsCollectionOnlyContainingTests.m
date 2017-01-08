//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsCollectionOnlyContaining.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCOrderingComparison.h>

#import "MatcherTestCase.h"
#import "Mismatchable.h"


@interface OnlyContainsTests : MatcherTestCase
@end

@implementation OnlyContainsTests

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
                  onlyContains(equalTo(@1), nil),
                  [NSSet setWithObject:@1]);
}

- (void)testMatchesAllItemsWithOneMatcher
{
    assertMatches(@"one matcher",
                  onlyContains(lessThan(@4), nil),
                  (@[@1, @2, @3]));
}

- (void)testMatchesAllItemsWithMultipleMatchers
{
    assertMatches(@"multiple matcher",
                  onlyContains(lessThan(@4), equalTo(@"hi"), nil),
                  (@[@1, @"hi", @2, @3]));
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equal_to",
                  onlyContains(lessThan(@4), @"hi", nil),
                  (@[@1, @"hi", @2, @3]));
}

- (void)testArrayVariant_ProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"Values automatically wrapped with equal_to",
            onlyContainsIn(@[lessThan(@4), @"hi"]),
            (@[@1, @"hi", @2, @3]));
}

- (void)testDoesNotMatchCollectionWithMismatchingItem
{
    assertDoesNotMatch(@"4 is not less than 4",
                       onlyContains(lessThan(@4), nil),
                       (@[@2, @3, @4]));
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(onlyContains(nil), @"Should require non-nil list");
#pragma clang diagnostic pop
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a collection containing items matching (<1> or <2>)",
                        onlyContains(@1, @2, nil));
}

@end
