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
    if (self)
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
    NSString* dayAsString[] =
        { @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday" };
    [[description appendText:@"calendar date falling on "] appendText:dayAsString[day]];
}

@end


id <HCMatcher> onASaturday()
{
    return [IsGivenDayOfWeek isGivenDayOfWeek:6];
}
