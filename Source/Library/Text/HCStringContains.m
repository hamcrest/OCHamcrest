//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCStringContains.h"


@implementation HCStringContains

+ (instancetype)stringContains:(NSString *)substring
{
    return [[self alloc] initWithSubstring:substring];
}

- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(rangeOfString:)])
        return NO;

    return [item rangeOfString:self.substring].location != NSNotFound;
}

- (NSString *)relationship
{
    return @"containing";
}

@end


id <HCMatcher> HC_containsString(NSString *aString)
{
    return HC_containsSubstring(aString);
}

id <HCMatcher> HC_containsSubstring(NSString *substring)
{
    return [HCStringContains stringContains:substring];
}
