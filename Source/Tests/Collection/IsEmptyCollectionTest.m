//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEmptyCollection.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface IsEmptyCollectionTest : AbstractMatcherTest
@end


@implementation IsEmptyCollectionTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = isEmpty();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testShouldNotMatchNonCollection
{
    assertDoesNotMatch(@"Non collection", isEmpty(), [[NSObject alloc] init]);
}

- (void)testMatchesEmptyCollection
{
    assertMatches(@"empty", isEmpty(), [FakeWithCount fakeWithCount:0]);
}

- (void)testDoesNotMatchesNonEmptyCollection
{
    assertDoesNotMatch(@"non-empty", isEmpty(), [FakeWithCount fakeWithCount:1]);
}

- (void)testDoesNotMatchItemWithoutCount
{
    assertDoesNotMatch(@"no count", isEmpty(), [FakeWithoutCount fake]);
}

- (void)testHasReadableDescription
{
    assertDescription(@"empty collection", isEmpty());
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", isEmpty(), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was <FakeWithCount>", isEmpty(), [FakeWithCount fakeWithCount:1]);
}

@end
