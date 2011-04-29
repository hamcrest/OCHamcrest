//
//  OCHamcrest - HCStringStartsWith.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCStringStartsWith.h"

#import "HCDescription.h"


@implementation HCStringStartsWith

+ (id)stringStartsWith:(NSString *)aSubstring
{
    return [[[self alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(hasPrefix:)])
        return NO;
    
    return [item hasPrefix:substring];
}


- (NSString *)relationship
{
    return @"starting with";
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_startsWith(NSString *aSubstring)
{
    return [HCStringStartsWith stringStartsWith:aSubstring];
}
