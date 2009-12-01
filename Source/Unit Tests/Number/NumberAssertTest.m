//
//  OCHamcrest - NumberAssertTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <SenTestingKit/SenTestingKit.h>

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCNumberAssert.h>
#import <OCHamcrest/HCIsEqual.h>


@interface NumberAssertTest : SenTestCase
@end

@implementation NumberAssertTest

- (void) setUp
{
    [self raiseAfterFailure];
}


- (void) testSuccess_withBool
{
    assertThatBool(YES, equalTo([NSNumber numberWithBool:YES]));
}


- (void) testFailure_withBool
{
    @try
    {
        assertThatBool(YES, equalTo([NSNumber numberWithBool:NO]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <0>, got <1>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withChar
{
    assertThatChar('A', equalTo([NSNumber numberWithChar:'A']));
}


- (void) testFailure_withChar
{
    @try
    {
        assertThatChar('B', equalTo([NSNumber numberWithChar:'A']));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <65>, got <66>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withDouble
{
    assertThatDouble(1.5, equalTo([NSNumber numberWithDouble:1.5]));
}


- (void) testFailure_withDouble
{
    @try
    {
        assertThatDouble(2.5, equalTo([NSNumber numberWithDouble:1.5]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1.5>, got <2.5>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withFloat
{
    assertThatFloat(1.5f, equalTo([NSNumber numberWithFloat:1.5f]));
}


- (void) testFailure_withFloat
{
    @try
    {
        assertThatFloat(2.5f, equalTo([NSNumber numberWithFloat:1.5f]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1.5>, got <2.5>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withInt
{
    assertThatInt(1, equalTo([NSNumber numberWithInt:1]));
}


- (void) testFailure_withInt
{
    @try
    {
        assertThatInt(2, equalTo([NSNumber numberWithInt:1]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withLong
{
    assertThatLong(1L, equalTo([NSNumber numberWithLong:1L]));
}


- (void) testFailure_withLong
{
    @try
    {
        assertThatLong(2L, equalTo([NSNumber numberWithLong:1L]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withLongLong
{
    assertThatLongLong(1LL, equalTo([NSNumber numberWithLongLong:1LL]));
}


- (void) testFailure_withLongLong
{
    @try
    {
        assertThatLongLong(2LL, equalTo([NSNumber numberWithLongLong:1LL]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withShort
{
    assertThatShort(1, equalTo([NSNumber numberWithShort:1]));
}


- (void) testFailure_withShort
{
    @try
    {
        assertThatShort(2, equalTo([NSNumber numberWithShort:1]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedChar
{
    assertThatUnsignedChar('A', equalTo([NSNumber numberWithUnsignedChar:'A']));
}


- (void) testFailure_withUnsignedChar
{
    @try
    {
        assertThatUnsignedChar('B', equalTo([NSNumber numberWithUnsignedChar:'A']));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <65>, got <66>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedInt
{
    assertThatUnsignedInt(1U, equalTo([NSNumber numberWithUnsignedInt:1U]));
}


- (void) testFailure_withUnsignedInt
{
    @try
    {
        assertThatUnsignedInt(2U, equalTo([NSNumber numberWithUnsignedInt:1U]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedLong
{
    assertThatUnsignedLong(1UL, equalTo([NSNumber numberWithUnsignedLong:1UL]));
}


- (void) testFailure_withUnsignedLong
{
    @try
    {
        assertThatUnsignedLong(2UL, equalTo([NSNumber numberWithUnsignedLong:1UL]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedLongLong
{
    assertThatUnsignedLongLong(1ULL, equalTo([NSNumber numberWithUnsignedLongLong:1ULL]));
}


- (void) testFailure_withUnsignedLongLong
{
    @try
    {
        assertThatUnsignedLongLong(2ULL, equalTo([NSNumber numberWithUnsignedLongLong:1ULL]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedShort
{
    assertThatUnsignedShort(1U, equalTo([NSNumber numberWithUnsignedShort:1U]));
}


- (void) testFailure_withUnsignedShort
{
    @try
    {
        assertThatUnsignedShort(2U, equalTo([NSNumber numberWithUnsignedShort:1U]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2

- (void) testSuccess_withInteger
{
    assertThatInteger(1, equalTo([NSNumber numberWithInteger:1]));
}


- (void) testFailure_withInteger
{
    @try
    {
        assertThatInteger(2, equalTo([NSNumber numberWithInteger:1]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}


- (void) testSuccess_withUnsignedInteger
{
    assertThatUnsignedInteger(1, equalTo([NSNumber numberWithUnsignedInteger:1]));
}


- (void) testFailure_withUnsignedInteger
{
    @try
    {
        assertThatUnsignedInteger(2, equalTo([NSNumber numberWithUnsignedInteger:1]));
    }
    @catch (NSException* exception)
    {
        STAssertEqualObjects(@"Expected <1>, got <2>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}

#endif  // Objective-C 2.0

@end
