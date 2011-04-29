//
//  OCHamcrest - HCStringContains.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCStringContains.h"

#import "HCDescription.h"


@implementation HCStringContains

+ (id)stringContains:(NSString *)aSubstring
{
    return [[[self alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(rangeOfString:)])
        return NO;
    
    return [item rangeOfString:substring].location != NSNotFound;
}


- (NSString *)relationship
{
    return @"containing";
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_containsString(NSString *aSubstring)
{
    return [HCStringContains stringContains:aSubstring];
}
