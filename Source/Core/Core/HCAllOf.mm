//
//  OCHamcrest - HCAllOf.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCAllOf.h"

    // OCHamcrest
#import "HCDescription.h"

    // OCHamcrest internal
#import "HCCollectMatchers.h"


@implementation HCAllOf

+ (HCAllOf*) allOf:(NSArray*)theMatchers
{
    return [[[HCAllOf alloc] initWithMatchers:theMatchers] autorelease];
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
    return [self matches:item describingMismatchTo:nil];
}


- (BOOL) matches:(id)item describingMismatchTo:(id<HCDescription>)mismatchDescription
{
#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2
    for (id<HCMatcher> oneMatcher in matchers)
#else
    NSEnumerator* enumerator = [matchers objectEnumerator];
    id<HCMatcher> oneMatcher;
    while ((oneMatcher = [enumerator nextObject]) != nil)
#endif
    {
        if (![oneMatcher matches:item])
        {
            [[mismatchDescription appendDescriptionOf:oneMatcher] appendText:@" "];
            [oneMatcher describeMismatchOf:item to:mismatchDescription];
            return NO;
        }
    }
    return YES;
}


- (void) describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    (void) [self matches:item describingMismatchTo:mismatchDescription];
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendList:matchers start:@"(" separator:@" and " end:@")"];
}

@end


extern "C" {

id<HCMatcher> HC_allOf(id<HCMatcher> matcher, ...)
{
    va_list args;
    va_start(args, matcher);
    NSArray* matcherList = HC_collectMatchers(matcher, args);
    va_end(args);
    
    return [HCAllOf allOf:matcherList];
}

}   // extern "C"
