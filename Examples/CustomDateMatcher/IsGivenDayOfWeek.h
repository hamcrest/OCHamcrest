#import <OCHamcrest/HCBaseMatcher.h>
#import <objc/objc-api.h>

// Matches dates that fall on a given day of the week.
@interface IsGivenDayOfWeek : HCBaseMatcher
{
    NSInteger day;      // Sunday is 0, Saturday is 6
}

+ (instancetype)isGivenDayOfWeek:(NSInteger)dayOfWeek;
- (instancetype)initWithDay:(NSInteger)dayOfWeek;

@end


// Factory function to generate Saturday matcher.
OBJC_EXPORT id <HCMatcher> onASaturday();
