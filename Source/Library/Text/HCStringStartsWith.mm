//
//  OCHamcrest - HCStringStartsWith.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCStringStartsWith.h"

    // OCHamcrest
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

//--------------------------------------------------------------------------------------------------

OBJC_EXPORT id<HCMatcher> HC_startsWith(NSString *aSubstring)
{
    return [HCStringStartsWith stringStartsWith:aSubstring];
}
