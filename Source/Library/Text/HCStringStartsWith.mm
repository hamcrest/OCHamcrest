//
//  OCHamcrest - HCStringStartsWith.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCStringStartsWith.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation HCStringStartsWith

+ (HCStringStartsWith*) stringStartsWith:(NSString*)aSubstring
{
    return [[[HCStringStartsWith alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(hasPrefix:)])
        return NO;
    
    return [item hasPrefix:substring];
}

@end


@implementation HCStringStartsWith (SubclassResponsibility)

- (NSString*) relationship
{
    return @"starting with";
}

@end


extern "C" {

id<HCMatcher> HC_startsWith(NSString* aSubstring)
{
    return [HCStringStartsWith stringStartsWith:aSubstring];
}

}   // extern "C"
