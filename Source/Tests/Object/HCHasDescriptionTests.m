//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCHasDescription.h>

#import <OCHamcrest/HCIsEqual.h>

#import "MatcherTestCase.h"


static NSString *fakeDescription = @"DESCRIPTION";

@interface FakeWithDescription : NSObject
@end

@implementation FakeWithDescription
+ (instancetype)fake  { return [[self alloc] init]; }
- (NSString *)description  { return fakeDescription; }
@end


@interface HasDescriptionTests : MatcherTestCase
@end

@implementation HasDescriptionTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = hasDescription(equalTo(@"irrelevant"));

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
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
