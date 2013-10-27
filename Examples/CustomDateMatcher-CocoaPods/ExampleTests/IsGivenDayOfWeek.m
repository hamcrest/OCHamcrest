#import "IsGivenDayOfWeek.h"
#import <OCHamcrest/HCDescription.h>

@implementation IsGivenDayOfWeek

- (instancetype)initWithDayOfWeek:(NSInteger)dayOfWeek
{
    self = [super init];
    if (self)
        _dayOfWeek = dayOfWeek;
    return self;
}

// Test whether item matches.
- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(dayOfWeek)])
        return NO;

    return [item dayOfWeek] == _dayOfWeek;
}

// Describe the matcher.
- (void)describeTo:(id <HCDescription>)description
{
    NSString* dayAsString[] =
        { @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday" };
    [[description appendText:@"calendar date falling on "] appendText:dayAsString[_dayOfWeek]];
}

@end


id onASaturday()
{
    return [[IsGivenDayOfWeek alloc] initWithDayOfWeek:6];
}
