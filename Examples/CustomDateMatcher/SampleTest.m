#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "IsGivenDayOfWeek.h"

@interface SampleTest : SenTestCase
@end

@implementation SampleTest

- (void)testDateIsOnASaturday
{
    // Example of a successful match.
    NSCalendarDate* date = [NSCalendarDate dateWithString:@"26 Apr 2008" calendarFormat:@"%d %b %Y"];
    assertThat(date, is(onASaturday()));
}

- (void)testFailsWithMismatchedDate
{
    // Example of what happens with date that doesn't match.
    NSCalendarDate* date = [NSCalendarDate dateWithString:@"06 Apr 2008" calendarFormat:@"%d %b %Y"];
    assertThat(date, is(onASaturday()));
}

- (void)testFailsWithNonDate
{
    // Example of what happens with object that isn't a date.
    NSString* nonDate = @"oops";
    assertThat(nonDate, is(onASaturday()));
}

@end
