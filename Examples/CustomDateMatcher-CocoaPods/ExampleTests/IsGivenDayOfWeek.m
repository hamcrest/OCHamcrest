#import "IsGivenDayOfWeek.h"

static NSString* const dayAsString[] =
        { @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday" };


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

    return [item dayOfWeek] == self.dayOfWeek;
}

// Describe the matcher.
- (void)describeTo:(id <HCDescription>)description
{
    [[description appendText:@"calendar date falling on "] appendText:dayAsString[self.dayOfWeek]];
}

@end


id onASaturday()
{
    return [[IsGivenDayOfWeek alloc] initWithDayOfWeek:6];
}
