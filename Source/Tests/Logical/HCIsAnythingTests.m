//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsAnything.h>

#import "MatcherTestCase.h"


@interface IsAnythingTests : MatcherTestCase
@end

@implementation IsAnythingTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = anything();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testAlwaysEvaluatesToTrue
{
    assertMatches(@"nil", anything(), nil);
    assertMatches(@"object", anything(), [[NSObject alloc] init]);
    assertMatches(@"string", anything(), @"hi");
}

- (void)testHasUsefulDefaultDescription
{
    assertDescription(@"ANYTHING", anything());
}

- (void)testCanOverrideDescription
{
    NSString *description = @"DESCRIPTION";
    assertDescription(description, anythingWithDescription(description));
}

- (void)testMatchAlwaysSucceedsSoShouldNotGenerateMismatchDescription
{
    assertNoMismatchDescription(anything(), @"hi");
}

@end
