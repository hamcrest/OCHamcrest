//
//  OCHamcrest - HCAnyOf.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCAnyOf.h"

#import "HCCollectMatchers.h"
#import "HCDescription.h"


@implementation HCAnyOf

+ (id)anyOf:(NSArray *)theMatchers
{
    return [[[self alloc] initWithMatchers:theMatchers] autorelease];
}


- (id)initWithMatchers:(NSArray *)theMatchers
{
    self = [super init];
    if (self != nil)
        matchers = [theMatchers retain];
    return self;
}


- (void)dealloc
{
    [matchers release];
    [super dealloc];
}


- (BOOL)matches:(id)item
{
    for (id<HCMatcher> oneMatcher in matchers)
    {
        if ([oneMatcher matches:item])
            return YES;
    }
    return NO;
}


- (void)describeTo:(id<HCDescription>)description
{
    [description appendList:matchers start:@"(" separator:@" or " end:@")"];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_anyOf(id item, ...)
{
    va_list args;
    va_start(args, item);
    NSArray *matcherList = HCCollectMatchers(item, args);
    va_end(args);
    
    return [HCAnyOf anyOf:matcherList];
}
