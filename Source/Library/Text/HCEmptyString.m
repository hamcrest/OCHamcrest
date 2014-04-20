#import "HCEmptyString.h"


@implementation HCEmptyString

+ (instancetype)emptyString
{
    return [[self alloc] init];
}

- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(rangeOfString:)]) {
        return NO;
    }
    
    return [item length] == 0;
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"an empty string"];
}

@end


id <HCMatcher> HC_emptyString(void)
{
    return [HCEmptyString emptyString];
}
