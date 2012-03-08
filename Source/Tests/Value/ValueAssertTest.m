#define HC_SHORTHAND
#import <OCHamcrest/HCValueAssert.h>
#import <OCHamcrest/HCValueMatcher.h>
#import <OCHamcrest/HCIsNot.h>

#import <SenTestingKit/SenTestingKit.h>


@interface ValueAssertTest : SenTestCase
@end


@implementation ValueAssertTest

- (void)testSuccess_withPoint
{
    assertThatPoint(NSMakePoint(1, 2), equalToPoint(NSMakePoint(1, 2)));
}

- (void)testFailure_withPoint {
    assertThatPoint(NSMakePoint(1, 2), isNot(equalToPoint(NSMakePoint(2, 3))));

    // The assertion fails, but the exception does not get caught.

//    @try {
//        assertThatPoint(NSMakePoint(1, 2), equalToPoint(NSMakePoint(2, 3)));
//    }
//    @catch (NSException *exception)
//    {
//        STAssertEqualObjects(@"Expected <NSPoint: {1, 3}>, but was <NSPoint: {1, 2}>", [exception reason], nil);
//        return;
//    }
//    STFail(@"shoud have failed");
}

- (void)testSuccess_withSize
{
    assertThatSize(NSMakeSize(1, 2), equalToSize(NSMakeSize(1, 2)));
}

- (void)testFailure_withSize {
    assertThatSize(NSMakeSize(1, 2), isNot(equalToSize(NSMakeSize(2, 3))));

    // The assertion fails, but the exception does not get caught.

//    @try {
//        assertThatSize(NSMakeSize(1, 2), equalToSize(NSMakeSize(2, 3)));
//    }
//    @catch (NSException *exception)
//    {
//        STAssertEqualObjects(@"Expected <NSSize: {1, 3}>, but was <NSSize: {1, 2}>", [exception reason], nil);
//        return;
//    }
//    STFail(@"shoud have failed");
}

- (void)testSuccess_withRect {
    assertThatRect(NSMakeRect(1, 2, 3, 4), equalToRect(NSMakeRect(1, 2, 3, 4)));
}

- (void)testFailure_withRect {
    assertThatRect(NSMakeRect(1, 2, 3, 4), isNot(equalToRect(NSMakeRect(2, 3, 1, 2))));

    // The assertion fails, but the exception does not get caught.

//    @try {
//        assertThatRect(NSMakeRect(1, 2, 3, 4), equalToRect(NSMakeRect(2, 3, 1, 2)));
//    }
//    @catch (NSException *exception)
//    {
//        STAssertEqualObjects(@"Expected value equal to NSRect: {{2, 3}, {1, 2}}, but was <NSRect: {{1, 2}, {3, 4}}>", [exception reason], nil);
//        return;
//    }
//    STFail(@"shoud have failed");
}

- (void)testSuccess_withRange {
    assertThatRange(NSMakeRange(1, 2), equalToRange(NSMakeRange(1, 2)));
}

- (void)testFailure_withRange {
    assertThatRange(NSMakeRange(1, 2), isNot(equalToRange(NSMakeRange(2, 3))));

    // The assertion fails, but the exception does not get caught.

//    @try {
//        assertThatRange(NSMakeRange(1, 2), equalToRange(NSMakeRange(2, 3)));
//    }
//    @catch (NSException *exception)
//    {
//        STAssertEqualObjects(@"Expected <NSRange: {1, 3}>, but was <NSRange: {1, 2}>", [exception reason], nil);
//        return;
//    }
//    STFail(@"shoud have failed");
}
@end
