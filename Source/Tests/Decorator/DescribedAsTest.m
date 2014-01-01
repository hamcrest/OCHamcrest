//
//  OCHamcrest - DescribedAsTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCDescribedAs.h>

    // Collaborators
#import <OCHamcrest/HCIsAnything.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "NeverMatch.h"


@interface DescribedAsTest : AbstractMatcherTest
@end

@implementation DescribedAsTest

- (id <HCMatcher>)createMatcher
{
    return describedAs(@"irrelevant", anything(), nil);
}

- (void)testOverridesDescriptionOfNestedMatcherInitializerArgument
{
    id m1 = describedAs(@"m1 description", anything(), nil);
    id m2 = describedAs(@"m2 description", [NeverMatch neverMatch], nil);

    assertDescription(@"m1 description", m1);
    assertDescription(@"m2 description", m2);
}

- (void)testAppendsValuesToDescription
{
    id m = describedAs(@"value 1 = %0, value 2 = %1",
                       anything(),
                       @33,
                       @97,
                       nil);
    
    assertDescription(@"value 1 = <33>, value 2 = <97>", m);
}

- (void)testHandlesSubstitutionAtBeginning
{
    id m = describedAs(@"%0ok",
                       anything(),
                       @33,
                       nil);
    
    assertDescription(@"<33>ok", m);
}

- (void)testHandlesSubstitutionAtEnd
{
    id m = describedAs(@"ok%0",
                       anything(),
                       @33,
                       nil);
    
    assertDescription(@"ok<33>", m);
}

- (void)testDoesNotProcessPercentFollowedByNonDigit
{
    id m = describedAs(@"With 33% remaining", anything(), nil);
    
    assertDescription(@"With 33% remaining", m);
}

- (void)testDelegatesMatchingToNestedMatcher
{
    id m1 = describedAs(@"m1 description", anything(), nil);
    id m2 = describedAs(@"m2 description", [NeverMatch neverMatch], nil);

    STAssertTrue([m1 matches:@"hi"], @"");
    STAssertFalse([m2 matches:@"hi"], @"");
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(describedAs(@"irrelevant", anything(), nil), @"hi");
}

- (void)testDelegatesMismatchDescriptionToNestedMatcher
{
    assertMismatchDescription([NeverMatch mismatchDescription],
                              describedAs(@"irrelevant", [NeverMatch neverMatch], nil),
                              @"hi");
}

- (void)testDelegatesDescribeMismatchToNestedMatcher
{
    assertDescribeMismatch([NeverMatch mismatchDescription],
                           describedAs(@"irrelevant", [NeverMatch neverMatch], nil),
                           @"hi");
}

@end
