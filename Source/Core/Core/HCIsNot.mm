//
//  OCHamcrest - HCIsNot.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCIsNot.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsNot

+ (id) isNot:(id<HCMatcher>)aMatcher
{
    return [[[self alloc] initNot:aMatcher] autorelease];
}


- (id) initNot:(id<HCMatcher>)aMatcher
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
    return ![matcher matches:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"not "] appendDescriptionOf:matcher];
}

@end


OBJC_EXPORT id<HCMatcher> HC_isNot(id matcherOrValue)
{
    return [HCIsNot isNot:HCWrapInMatcher(matcherOrValue)];
}
