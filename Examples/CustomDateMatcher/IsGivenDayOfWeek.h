#import <OCHamcrest/HCBaseMatcher.h>
#import <objc/objc-api.h>

@interface IsGivenDayOfWeek : HCBaseMatcher
{
    NSInteger day;      // 0 indicates Sunday
}

+ (IsGivenDayOfWeek*) isGivenDayOfWeek:(NSInteger)dayOfWeek;
- (id) initWithDay:(NSInteger)dayOfWeek;

@end


OBJC_EXPORT id<HCMatcher> onASaturday();
