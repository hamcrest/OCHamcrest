//
//  OCHamcrest - HCAllOf.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCAllOf.h"

    // OCHamcrest
#import "HCCollectMatchers.h"
#import "HCDescription.h"


@implementation HCAllOf

+ (id)allOf:(NSArray *)theMatchers
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
    return [self matches:item describingMismatchTo:nil];
}


- (BOOL)matches:(id)item describingMismatchTo:(id<HCDescription>)mismatchDescription
{
    for (id<HCMatcher> oneMatcher in matchers)
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


- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    (void) [self matches:item describingMismatchTo:mismatchDescription];
}


- (void)describeTo:(id<HCDescription>)description
{
    [description appendList:matchers start:@"(" separator:@" and " end:@")"];
}

@end

//--------------------------------------------------------------------------------------------------

OBJC_EXPORT id<HCMatcher> HC_allOf(id<HCMatcher> matcher, ...)
{
    va_list args;
    va_start(args, matcher);
    NSArray *matcherList = HCCollectMatchers(matcher, args);
    va_end(args);
    
    return [HCAllOf allOf:matcherList];
}
