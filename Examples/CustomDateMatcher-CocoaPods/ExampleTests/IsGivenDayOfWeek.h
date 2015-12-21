#import <OCHamcrest/HCBaseMatcher.h>


// Matches dates that fall on a given day of the week.
@interface IsGivenDayOfWeek : HCBaseMatcher

@property (nonatomic, readonly, assign) NSInteger dayOfWeek;  // Sunday is 0, Saturday is 6

- (instancetype)initWithDayOfWeek:(NSInteger)dayOfWeek;

@end


// Factory function to generate Saturday matcher.
FOUNDATION_EXPORT id onASaturday();
