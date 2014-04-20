    // Module under test
#define HC_SHORTHAND
#import "HCAssertBoolean.h"

    // Test support
#import <SenTestingKit/SenTestingKit.h>


@interface AssertBooleanTest : SenTestCase
@end

@implementation AssertBooleanTest

- (void)testAssertYes
{
    assertYes(YES);
}

- (void)testAssertNo
{
    assertNo(NO);
}

@end
