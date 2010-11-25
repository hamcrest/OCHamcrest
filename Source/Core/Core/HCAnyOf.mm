//
//  OCHamcrest - HCAnyOf.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCAnyOf.h"

    // OCHamcrest
#import "HCDescription.h"

    // OCHamcrest internal
#import "HCCollectMatchers.h"


@implementation HCAnyOf

+ (HCAnyOf*) anyOf:(NSArray*)theMatchers
{
    return [[[HCAnyOf alloc] initWithMatchers:theMatchers] autorelease];
}


- (id) initWithMatchers:(NSArray*)theMatchers
{
    self = [super init];
    if (self != nil)
        matchers = [theMatchers retain];
    return self;
}


- (void) dealloc
{
    [matchers release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    for (id<HCMatcher> oneMatcher in matchers)
    {
        if ([oneMatcher matches:item])
            return YES;
    }
    return NO;
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendList:matchers start:@"(" separator:@" or " end:@")"];
}

@end


OBJC_EXPORT id<HCMatcher> HC_anyOf(id<HCMatcher> matcher, ...)
{
    va_list args;
    va_start(args, matcher);
    NSArray* matcherList = HCCollectMatchers(matcher, args);
    va_end(args);
    
    return [HCAnyOf anyOf:matcherList];
}
