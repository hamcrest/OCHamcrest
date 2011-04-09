//
//  OCHamcrest - IsEqualIgnoringWhiteSpaceTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualIgnoringWhiteSpace.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsEqualIgnoringWhiteSpaceTest : AbstractMatcherTest
{
    id<HCMatcher> matcher;
}
@end


@implementation IsEqualIgnoringWhiteSpaceTest

- (void)setUp
{
    matcher = [equalToIgnoringWhiteSpace(@"Hello World   how\n are we? ") retain];
}


- (void)tearDown
{
    [matcher release];
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
    assertDoesNotMatch(@"non-string", matcher, [NSNumber numberWithInt:3]);
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
