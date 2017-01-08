//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCEvery.h>

#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCOrderingComparison.h>

#import "MatcherTestCase.h"
#import "Mismatchable.h"


@interface EveryItemTests : MatcherTestCase
@end

@implementation EveryItemTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = everyItem(equalTo(@"irrelevant"));

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testDoesNotMatchEmptyCollection
{
    id matcher = everyItem(equalTo(@"irrelevant"));

    assertMismatchDescription(@"was empty", matcher, @[]);
}

- (void)testReportAllElementsThatDoNotMatch
{
    id matcher = everyItem([Mismatchable mismatchable:@"a"]);

    assertMismatchDescription(@"mismatches were: [mismatched: b, mismatched: c]", matcher, (@[@"b", @"a", @"c"]));
}

- (void)testDoesNotMatchNonCollection
{
    id matcher = everyItem(equalTo(@"irrelevant"));

    assertMismatchDescription(@"was non-collection nil", matcher, nil);
}

- (void)testMatchesSingletonCollection
{
    assertMatches(@"singleton collection", everyItem(equalTo(@1)), [NSSet setWithObject:@1]);
}

- (void)testMatchesAllItemsWithOneMatcher
{
    assertMatches(@"one matcher", everyItem(lessThan(@4)), (@[@1, @2, @3]));
}

- (void)testDoesNotMatchCollectionWithMismatchingItem
{
    assertDoesNotMatch(@"4 is not less than 4", everyItem(lessThan(@4)), (@[@2, @3, @4]));
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(everyItem(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasAReadableDescription
{
    assertDescription(@"every item is a value less than <4>", everyItem(lessThan(@4)));
}

@end
