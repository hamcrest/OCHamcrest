//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "HCIsEqualCompressingWhiteSpace.h"

#import "MatcherTestCase.h"


@interface EqualToCompressingWhiteSpaceTests : MatcherTestCase
@end

@implementation EqualToCompressingWhiteSpaceTests
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = equalToCompressingWhiteSpace(@" Hello World   how\n are we? ");
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

- (void)testPassesIfWordsAreSameButWhitespaceDiffers
{
    assertMatches(@"less whitespace", matcher, @"Hello World how are we?");
    assertMatches(@"more whitespace", matcher, @"   Hello World   how are \n\n\twe?");
}

- (void)testFailsIfTextOtherThanWhitespaceDiffers
{
    assertDoesNotMatch(@"wrong word", matcher, @"Hello PLANET how are we?");
    assertDoesNotMatch(@"incomplete", matcher, @"Hello World how are we");
}

- (void)testFailsIfWhitespaceIsAddedOrRemovedInMidWord
{
    assertDoesNotMatch(@"need whitespace between Hello and World",
                       matcher, @"HelloWorld how are we?");
    assertDoesNotMatch(@"wrong whitespace within World",
                       matcher, @"Hello Wo rld how are we?");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertThrows(equalToCompressingWhiteSpace(nil), @"Should require non-nil argument");
#pragma clang diagnostic pop
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"\" Hello World   how\\n are we? \" ignoring whitespace", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(equalToCompressingWhiteSpace(@"foo\nbar"), @"foo bar");
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
