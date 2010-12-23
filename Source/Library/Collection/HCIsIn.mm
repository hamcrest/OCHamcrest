//
//  OCHamcrest - HCIsIn.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsIn.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation HCIsIn

+ (id) isInCollection:(id)aCollection
{
    return [[[self alloc] initWithCollection:aCollection] autorelease];
}


- (id) initWithCollection:(id)aCollection
{
    if (![aCollection respondsToSelector:@selector(containsObject:)])
    {
        @throw [NSException exceptionWithName: @"NotAContainer"
                                       reason: @"Object must respond to -containsObject:"
                                     userInfo: nil];
    }
    
    self = [super init];
    if (self != nil)
        collection = [aCollection retain];
    return self;
}

- (void) dealloc
{
    [collection release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [collection containsObject:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendText:@"one of "];
    [description appendList:collection start:@"{" separator:@", " end:@"}"];
}

@end


OBJC_EXPORT id<HCMatcher> HC_isIn(id aCollection)
{
    return [HCIsIn isInCollection:aCollection];
}
