//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsIn.h>

#import "MatcherTestCase.h"


@interface IsInTests : MatcherTestCase
@end

@implementation IsInTests


- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = isIn(@[@1, @2, @3]);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testReturnsTrueIfArgumentIsInCollection
{
    id matcher = isIn(@[@1, @2, @3]);

    assertMatches(@"has 1", matcher, @1);
    assertMatches(@"has 2", matcher, @2);
    assertMatches(@"has 3", matcher, @3);
    assertDoesNotMatch(@"no 4", matcher, @4);
}

- (void)testMatcherCreationRequiresObjectWithContainsObjectMethod
{
    id object = [[NSObject alloc] init];

    XCTAssertThrows(isIn(object), @"object does not have -containsObject: method");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(isIn(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testHasReadableDescription
{
    id matcher = isIn(@[@1, @2, @3]);

    assertDescription(@"one of {<1>, <2>, <3>}", matcher);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", isIn(@[@1]), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was \"bad\"", isIn(@[@1]), @"bad");
}

@end
