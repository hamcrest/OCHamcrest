//
//  OCHamcrest - HCStringEndsWith.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCStringEndsWith.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation HCStringEndsWith

+ (id) stringEndsWith:(NSString*)aSubstring
{
    return [[[self alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(hasSuffix:)])
        return NO;
    
    return [item hasSuffix:substring];
}

@end


@implementation HCStringEndsWith (SubclassResponsibility)

- (NSString*) relationship
{
    return @"ending with";
}

@end


OBJC_EXPORT id<HCMatcher> HC_endsWith(NSString* aSubstring)
{
    return [HCStringEndsWith stringEndsWith:aSubstring];
}
