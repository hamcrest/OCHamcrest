//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsIn.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsInTest : AbstractMatcherTest
@end

@implementation IsInTest


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

    STAssertThrows(isIn(object), @"object does not have -containsObject: method");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(isIn(nil), @"Should require non-nil argument");
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
