    // Module under test
#define HC_SHORTHAND
#import "HCAssertBoolean.h"

    // Test support
#import <SenTestingKit/SenTestingKit.h>

#define EXPECT_FAILURE_WITH_MESSAGE(_code, _reason) \
@try { \
_code \
} \
@catch (NSException *exception) { \
    STAssertEqualObjects([exception reason], _reason, nil); \
    return; \
} \
STFail(@"should have failed");


@interface AssertBooleanTest : SenTestCase
@end

@implementation AssertBooleanTest

- (void)setUp
{
    [super setUp];
    [self raiseAfterFailure];
}

- (void)testAssertYesWithYesSucceeds
{
    assertYes(YES);
}

- (void)testAssertNoWithNoSucceeds
{
    assertNo(NO);
}

- (void)testAssertYesWithNoFails
{
    EXPECT_FAILURE_WITH_MESSAGE({
        assertYes(NO);
    }, @"Expected a BOOL with value <YES>, but was <NO>");
}

- (void)testAssertNoWithYesFails
{
    EXPECT_FAILURE_WITH_MESSAGE({
        assertNo(YES);
    }, @"Expected a BOOL with value <NO>, but was <YES>");
}

- (void)testAssertTrueWithYesSucceeds
{
    assertTrue(YES);
}

- (void)testAssertFalseWithNoSucceeds
{
    assertFalse(NO);
}

- (void)testAssertTrueWithNoFails
{
    EXPECT_FAILURE_WITH_MESSAGE({
        assertTrue(NO);
    }, @"Expected a BOOL with value <YES>, but was <NO>");
}

- (void)testAssertFalseWithYesFails
{
    EXPECT_FAILURE_WITH_MESSAGE({
        assertFalse(YES);
    }, @"Expected a BOOL with value <NO>, but was <YES>");
}

@end
