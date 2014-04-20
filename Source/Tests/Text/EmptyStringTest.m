    // Class under test
#define HC_SHORTHAND
#import "HCEmptyString.h"

    // Test support
#import "AbstractMatcherTest.h"


@interface EmptyStringTest : AbstractMatcherTest
@end

@implementation EmptyStringTest
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = emptyString();
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (id <HCMatcher>)createMatcher
{
    return matcher;
}

- (void)testEvaluatesToTrueIfArgumentIsAnEmptyString
{
    assertMatches(@"empty", matcher, @"");
}

- (void)testEvaluatesToFalseIfArgumentIsNotAnEmptyString
{
    assertDoesNotMatch(@"not empty", matcher, @"bla");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an empty string", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, @"");
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
