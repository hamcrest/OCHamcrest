//
//  OCHamcrest - CustomMatchers.h
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//


/**
    @page custom-matchers Writing custom matchers

OCHamcrest comes bundled with lots of useful matchers, but you'll probably find that you need to
create your own from time to time to fit your testing needs.
This commonly occurs when you find a fragment of code that tests the same set of properties over
and over again (and in different tests), and you want to bundle the fragment into a single assertion.
By writing your own matcher you'll eliminate code duplication and make your tests more readable!

Let's write our own matcher for testing if a calendar date falls on a Saturday. This is the test
we want to write:

    @code
- (void)testDateIsOnASaturday
{
    NSCalendarDate* date = [NSCalendarDate dateWithString:@"26 Apr 2008" calendarFormat:@"%d %b %Y"];
    assertThat(date, is(onASaturday()))
}
    @endcode

    Here's the interface:

    @code
#import <OCHamcrest/HCBaseMatcher.h>
#import <objc/objc-api.h>

@interface IsGivenDayOfWeek : HCBaseMatcher
{
    NSInteger day;      // Sunday is 0, Saturday is 6
}

+ (id)isGivenDayOfWeek:(NSInteger)dayOfWeek;
- (id)initWithDay:(NSInteger)dayOfWeek;

@end

OBJC_EXPORT id <HCMatcher> onASaturday();
    @endcode

    The interface consists of two parts: a class definition, and a factory function (with C binding).
    Here's what the implementation looks like:

    @code
#import "IsGivenDayOfWeek.h"
#import <OCHamcrest/HCDescription.h>

@implementation IsGivenDayOfWeek

+ (id)isGivenDayOfWeek:(NSInteger)dayOfWeek
{
    return [[self alloc] initWithDay:dayOfWeek];
}

- (id)initWithDay:(NSInteger)dayOfWeek
{
    self = [super init];
    if (self != nil)
        day = dayOfWeek;
    return self;
}

// Test whether item matches.
- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(dayOfWeek)])
        return NO;

    return [item dayOfWeek] == day;
}

// Describe the matcher.
- (void)describeTo:(id <HCDescription>)description
{
    NSString *dayAsString[] =
        { @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday" };
    [[description appendText:@"calendar date falling on "] appendText:dayAsString[day]];
}

@end


id <HCMatcher> onASaturday()
{
    return [IsGivenDayOfWeek isGivenDayOfWeek:6];
}
    @endcode

    For our Matcher implementation we implement the @c -matches: method (which calls
    @c -dayOfWeek after confirming that the argument has such a method) and the
    @c -describe_to: method (which is used to produce a failure message when a test fails).
    Here's an example of how the failure message looks:

    @code
NSCalendarDate* date = [NSCalendarDate dateWithString: @"6 April 2008"
                                       calendarFormat: @"%d %B %Y"];
assertThat(date, is(onASaturday()));
    @endcode

    fails with the message

    @verbatim Expected: is calendar date falling on Saturday, got: <06 April 2008> @endverbatim

    and Xcode shows it as a build error. Clicking the error message takes you to the assertion that
    failed.

    Even though the @c onASaturday function creates a new matcher each time it is called, you should
    not assume this is the only usage pattern for your matcher. Therefore you should make sure your
    matcher is stateless, so a single instance can be reused between matches.

 */
