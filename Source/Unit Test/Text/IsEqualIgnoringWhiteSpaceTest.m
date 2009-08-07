#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsEqualIgnoringWhiteSpace.h>
#import <hamcrest/HCIsNot.h>
#import <hamcrest/HCMatcherAssert.h>


@interface IsEqualIgnoringWhiteSpaceTest : AbstractMatcherTest
{
    id<HCMatcher> matcher;
}
@end

@implementation IsEqualIgnoringWhiteSpaceTest

- (void) setUp
{
    matcher = [equalToIgnoringWhiteSpace(@"Hello World   how\n are we? ") retain];
}


- (void) tearDown
{
    [matcher release];
}


- (id<HCMatcher>) createMatcher
{
    return matcher;
}


- (void) testPassesIfWordsAreSameButWhitespaceDiffers
{
    assertThat(@"Hello World how are we?", matcher);
    assertThat(@"   Hello World   how are \n\n\twe?", matcher);
}


- (void) testFailsIfTextOtherThanWhitespaceDiffers
{
    assertThat(@"Hello PLANET how are we?", isNot(matcher));
    assertThat(@"Hello World how are we", isNot(matcher));
}


- (void) testFailsIfWhitespaceIsAddedOrRemovedInMidWord
{
    assertThat(@"HelloWorld how are we?", isNot(matcher));
    assertThat(@"Hello Wo rld how are we?", isNot(matcher));
}


- (void) testFailsIfMatchingAgainstNil
{
    assertThat(nil, isNot(matcher));
}


- (void) testConstructorRequiresNonNilArgument
{    
    STAssertThrows(equalToIgnoringWhiteSpace(nil), @"should require non-nil argument");
}


- (void) testHasAReadableDescription
{
    assertDescription(@"equalToIgnoringWhiteSpace(\"Hello World   how\\n are we? \")",
                        matcher);
}

@end
