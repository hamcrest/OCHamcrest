//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAllOf.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCStringEndsWith.h>
#import <OCHamcrest/HCStringStartsWith.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface AllOfTest : AbstractMatcherTest
@end

@implementation AllOfTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = allOf(equalTo(@"irrelevant"), equalTo(@"irrelevant"), nil);

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testEvaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers
{
    id matcher = allOf(startsWith(@"goo"), endsWith(@"ood"), nil);

    assertMatches(@"didn't pass both sub-matchers", matcher, @"good");
    assertDoesNotMatch(@"didn't fail first sub-matcher", matcher, @"mood");
    assertDoesNotMatch(@"didn't fail second sub-matcher", matcher, @"goon");
    assertDoesNotMatch(@"didn't fail both sub-matchers", matcher, @"fred");
}

- (void)testEvaluatesToTheTheLogicalConjunctionOfManyOtherMatchers
{
    id matcher = allOf(startsWith(@"g"), startsWith(@"go"), endsWith(@"d"), startsWith(@"go"), startsWith(@"goo"), nil);

    assertMatches(@"didn't pass all sub-matchers", matcher, @"good");
    assertDoesNotMatch(@"didn't fail middle sub-matcher", matcher, @"goon");
}

- (void)testProvidesConvenientShortcutForMatchingWithEqualTo
{
    assertMatches(@"both matchers", allOf(@"good", @"good", nil), @"good");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"(\"good\" and \"bad\" and \"ugly\")",
                      allOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(allOf(equalTo(@"good"), equalTo(@"good"), nil),
                                @"good");
}

- (void)testMismatchDescriptionDescribesFirstFailingMatch
{
    assertMismatchDescription(@"\"good\" was \"bad\"",
                              allOf(equalTo(@"bad"), equalTo(@"good"), nil),
                              @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"\"good\" was \"bad\"",
                           allOf(equalTo(@"bad"), equalTo(@"good"), nil),
                           @"bad");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(allOf(nil), @"Should require non-nil list");
}

@end
