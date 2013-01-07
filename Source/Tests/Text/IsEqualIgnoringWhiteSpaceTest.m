//
//  OCHamcrest - IsEqualIgnoringWhiteSpaceTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualIgnoringWhiteSpace.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsEqualIgnoringWhiteSpaceTest : AbstractMatcherTest
@end

@implementation IsEqualIgnoringWhiteSpaceTest
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = equalToIgnoringWhiteSpace(@"Hello World   how\n are we? ");
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (id<HCMatcher>)createMatcher
{
    return matcher;
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
    STAssertThrows(equalToIgnoringWhiteSpace(nil), @"Should require non-nil argument");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"\"Hello World   how\\n are we? \" ignoring whitespace", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(equalToIgnoringWhiteSpace(@"foo\nbar"), @"foo bar");
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
