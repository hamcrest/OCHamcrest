#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "IsGivenDayOfWeek.h"

@interface SampleTest : SenTestCase
@end

@implementation SampleTest

- (void) testDateIsOnASaturday
{
    NSCalendarDate* date = [NSCalendarDate dateWithString:@"26 Apr 2008" calendarFormat:@"%d %b %Y"];
    assertThat(date, is(onASaturday()));
}

- (void) testFailsWithBadDate
{
    NSCalendarDate* date = [NSCalendarDate dateWithString:@"06 Apr 2008" calendarFormat:@"%d %b %Y"];
    assertThat(date, is(onASaturday()));
}

@end
