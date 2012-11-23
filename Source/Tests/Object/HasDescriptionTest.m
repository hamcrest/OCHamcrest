//
//  OCHamcrest - HasDescriptionTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCHasDescription.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


static NSString *fakeDescription = @"DESCRIPTION";

@interface FakeWithDescription : NSObject
@end

@implementation FakeWithDescription
+ (id)fake  { return [[self alloc] init]; }
- (NSString *)description  { return fakeDescription; }
@end


#pragma mark -

@interface HasDescriptionTest : AbstractMatcherTest
@end

@implementation HasDescriptionTest

- (id<HCMatcher>)createMatcher
{
    return hasDescription(equalTo(@"irrelevant"));
}

- (void)testPassesResultOfDescriptionToNestedMatcher
{
    FakeWithDescription* fake = [FakeWithDescription fake];
    assertMatches(@"equal", hasDescription(equalTo(fakeDescription)), fake);
    assertDoesNotMatch(@"unequal", hasDescription(equalTo(@"foo")), fake);
}

- (void)testProvidesConvenientShortcutForDescriptionEqualTo
{
    FakeWithDescription* fake = [FakeWithDescription fake];
    assertMatches(@"equal", hasDescription(fakeDescription), fake);
    assertDoesNotMatch(@"unequal", hasDescription(@"foo"), fake);
}

- (void)testMismatchDoesNotRepeatTheDescription
{
    FakeWithDescription* fake = [FakeWithDescription fake];
    assertMismatchDescription(@"was \"DESCRIPTION\"", hasDescription(@"foo"), fake);
}

- (void)testHasReadableDescription
{
    assertDescription(@"an object with description \"foo\"", hasDescription(@"foo"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasDescription(@"DESCRIPTION"), [FakeWithDescription fake]);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasDescription(@"foo"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasDescription(@"foo"), @"bad");
}

@end
