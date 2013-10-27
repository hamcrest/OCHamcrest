#import <OCHamcrest/HCBaseMatcher.h>

// Matches dates that fall on a given day of the week.
@interface IsGivenDayOfWeek : HCBaseMatcher
{
    NSInteger _dayOfWeek;      // Sunday is 0, Saturday is 6
}

- (instancetype)initWithDayOfWeek:(NSInteger)dayOfWeek;

@end


// Factory function to generate Saturday matcher.
OBJC_EXPORT id onASaturday();
