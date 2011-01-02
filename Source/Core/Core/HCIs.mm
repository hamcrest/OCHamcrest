//
//  OCHamcrest - HCIs.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIs.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIs

+ (id) is:(id<HCMatcher>)aMatcher
{
    return [[[self alloc] initWithMatcher:aMatcher] autorelease];
}


- (id) initWithMatcher:(id<HCMatcher>)aMatcher
{
    self = [super init];
    if (self != nil)
        matcher = [aMatcher retain];
    return self;
}


- (void) dealloc
{
    [matcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [matcher matches:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"is "] appendDescriptionOf:matcher];
}

@end


OBJC_EXPORT id<HCMatcher> HC_is(id matcherOrValue)
{
    return [HCIs is:HCWrapInMatcher(matcherOrValue)];
}
