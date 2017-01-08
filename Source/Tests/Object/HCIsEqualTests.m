//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


@interface FakeArgument : NSObject
@end

@implementation FakeArgument
- (NSString *)description  { return @"ARGUMENT DESCRIPTION"; }
@end


@interface AlwaysEqual : NSObject
@end

@implementation AlwaysEqual
- (BOOL)isEqual:(id)anObject  { return YES; }
@end


@interface NeverEqual : NSObject
@end

@implementation NeverEqual
- (BOOL)isEqual:(id)anObject  { return NO; }
@end


@interface EqualToTests : MatcherTestCase
@end

@implementation EqualToTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = equalTo(@"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testComparesObjectsUsingIsEqualMethod
{
    assertMatches(@"equal strings", equalTo(@"hi"), @"hi");
    assertDoesNotMatch(@"unequal strings", equalTo(@"hi"), @"bye");
}

- (void)testCanCompareNilValues
{
    assertMatches(@"nil equals nil", equalTo(nil), nil);

    assertDoesNotMatch(@"nil as argument", equalTo(@"hi"), nil);
    assertDoesNotMatch(@"nil in equalTo", equalTo(nil), @"hi");
}

- (void)testHonorsIsEqualImplementationEvenWithNilValues
{
    assertMatches(@"always equal", equalTo(nil), [[AlwaysEqual alloc] init]);
    assertDoesNotMatch(@"never equal", equalTo(nil), [[NeverEqual alloc] init]);
}

- (void)testIncludesTheResultOfCallingDescriptionOnItsArgumentInTheDescription
{
    assertDescription(@"<ARGUMENT DESCRIPTION>", equalTo([[FakeArgument alloc] init]));
}

- (void)testReturnsAnObviousDescriptionIfCreatedWithANestedMatcherByMistake
{
    id innerMatcher = equalTo(@"NestedMatcher");
    assertDescription(([@[@"<", [innerMatcher description], @">"]
                      componentsJoinedByString:@""]),
                      equalTo(innerMatcher));
}

- (void)testReturnsGoodDescriptionIfCreatedWithNilReference
{
    assertDescription(@"nil", equalTo(nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(equalTo(@"hi"), @"hi");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", equalTo(@"good"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", equalTo(@"good"), @"bad");
}

@end
