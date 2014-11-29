//
//  OCHamcrest - EveryTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCEvery.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCOrderingComparison.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "Mismatchable.h"


@interface EveryTest : AbstractMatcherTest
@end

@implementation EveryTest

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
    STAssertThrows(everyItem(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"every item is a value less than <4>", everyItem(lessThan(@4)));

}

@end
