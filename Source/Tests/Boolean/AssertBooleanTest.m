    // Module under test
#define HC_SHORTHAND
#import "HCAssertBoolean.h"

    // Test support
#import <SenTestingKit/SenTestingKit.h>


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
    @try {
        assertYes(NO);
    }
    @catch (NSException *exception) {
        STAssertEqualObjects([exception reason], @"Expected a BOOL with value <YES>, but was <NO>", nil);
        return;
    }
    STFail(@"should have failed");
}

@end
