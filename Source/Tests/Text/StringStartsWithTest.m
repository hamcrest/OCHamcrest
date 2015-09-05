//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#define HC_SHORTHAND
#import <OCHamcrest/HCStringStartsWith.h>

#import "AbstractMatcherTest.h"

static NSString *EXCERPT = @"EXCERPT";


@interface StringStartsWithTest : AbstractMatcherTest
@end

@implementation StringStartsWithTest
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = startsWith(EXCERPT);
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (void)testCopesWithNilsAndUnknownTypes
{
    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring
{
    assertMatches(@"excerpt at beginning", matcher, [EXCERPT stringByAppendingString:@"END"]);
    assertDoesNotMatch(@"excerpt at end", matcher, [@"START" stringByAppendingString:EXCERPT]);
    assertDoesNotMatch(@"excerpt in middle", matcher,
                  [[@"START" stringByAppendingString:EXCERPT] stringByAppendingString:@"END"]);
    assertMatches(@"excerpt repeated", matcher, [EXCERPT stringByAppendingString:EXCERPT]);

    assertDoesNotMatch(@"excerpt not in string", matcher, @"whatever");
    assertDoesNotMatch(@"only part of excerpt", matcher, [EXCERPT substringFromIndex:1]);
}

- (void)testEvaluatesToTrueIfArgumentIsEqualToSubstring
{
    assertMatches(@"excerpt is entire string", matcher, EXCERPT);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(startsWith(nil), @"Should require non-nil argument");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"a string starting with \"EXCERPT\"", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, EXCERPT);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", matcher, @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", matcher, @"bad");
}

@end
