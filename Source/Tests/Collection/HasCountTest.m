//
//  OCHamcrest - HasCountTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCHasCount.h>

    // Collaborators
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCOrderingComparison.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface HasCountTest : AbstractMatcherTest
@end

@implementation HasCountTest

- (id<HCMatcher>)createMatcher
{
    return hasCount(equalToUnsignedInteger(42));
}

- (void)testConvertsCountToNSNumberAndPassesToNestedMatcher
{
    FakeWithCount *fakeWithCount = [FakeWithCount fakeWithCount:5];
    
    assertMatches(@"same number", hasCount(equalToUnsignedInteger(5)), fakeWithCount);
    assertDoesNotMatch(@"different number", hasCount(equalToUnsignedInteger(6)), fakeWithCount);
}

- (void)testHasReadableDescription
{
    assertDescription(@"a collection with count of a value greater than <5>",
                      hasCount(greaterThan(@(5))));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasCountOf(2), ([NSSet setWithObjects:@"a", @"b", nil]));
}

- (void)testMismatchDescriptionForItemWithWrongCount
{
    assertMismatchDescription(@"was count of <42> with <FakeWithCount>",
                              hasCount(equalToUnsignedInteger(1)),
                              [FakeWithCount fakeWithCount:42]);
}

- (void)testMismatchDescriptionForItemWithoutCount
{
    assertMismatchDescription(@"was <FakeWithoutCount>",
                              hasCount(equalToUnsignedInteger(1)), [FakeWithoutCount fake]);
}

- (void)testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was count of <42> with <FakeWithCount>",
                           hasCount(equalToUnsignedInteger(1)), [FakeWithCount fakeWithCount:42]);
}

- (void)testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <FakeWithoutCount>",
                           hasCount(equalToUnsignedInteger(1)), [FakeWithoutCount fake]);
}

@end


#pragma mark -

@interface HasCountOfTest : AbstractMatcherTest
@end

@implementation HasCountOfTest

- (id<HCMatcher>)createMatcher
{
    return hasCountOf(42);
}

- (void)testHasCountOfIsShortcutForEqualToUnsignedInteger
{
    FakeWithCount *fakeWithCount = [FakeWithCount fakeWithCount:5];
    
    assertMatches(@"same number", hasCountOf(5), fakeWithCount);
    assertDoesNotMatch(@"different number", hasCountOf(6), fakeWithCount);
}

- (void)testHasReadableDescription
{
    assertDescription(@"a collection with count of <5>", hasCountOf(5));
}

- (void)testMismatchDescriptionForItemWithWrongCount
{
    assertMismatchDescription(@"was count of <42> with <FakeWithCount>",
                              hasCountOf(1), [FakeWithCount fakeWithCount:42]);
}

- (void)testMismatchDescriptionForItemWithoutCount
{
    assertMismatchDescription(@"was <FakeWithoutCount>", hasCountOf(1), [FakeWithoutCount fake]);
}

- (void)testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was count of <42> with <FakeWithCount>",
                           hasCountOf(1), [FakeWithCount fakeWithCount:42]);
}

- (void)testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <FakeWithoutCount>", hasCountOf(1), [FakeWithoutCount fake]);
}

@end
