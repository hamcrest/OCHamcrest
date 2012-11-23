//
//  OCHamcrest - IsEqualTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface FakeArgument : NSObject
@end

@implementation FakeArgument
- (NSString *)description  { return @"ARGUMENT DESCRIPTION"; }
@end


#pragma mark -

@interface AlwaysEqual : NSObject
@end

@implementation AlwaysEqual
- (BOOL)isEqual:(id)anObject  { return YES; }
@end


#pragma mark -

@interface NeverEqual : NSObject
@end

@implementation NeverEqual
- (BOOL)isEqual:(id)anObject  { return NO; }
@end


#pragma mark -

@interface IsEqualTest : AbstractMatcherTest
@end

@implementation IsEqualTest

- (id<HCMatcher>)createMatcher
{
    return equalTo(@"irrelevant");
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
    assertDescription(([[NSArray arrayWithObjects:@"<", [innerMatcher description], @">", nil]
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
