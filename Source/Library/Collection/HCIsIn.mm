//
//  OCHamcrest - HCIsIn.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsIn.h"

#import "HCDescription.h"


@implementation HCIsIn

+ (id)isInCollection:(id)aCollection
{
    return [[[self alloc] initWithCollection:aCollection] autorelease];
}

- (id)initWithCollection:(id)aCollection
{
    if (![aCollection respondsToSelector:@selector(containsObject:)])
    {
        @throw [NSException exceptionWithName:@"NotAContainer"
                                       reason:@"Object must respond to -containsObject:"
                                     userInfo:nil];
    }
    
    self = [super init];
    if (self)
        collection = [aCollection retain];
    return self;
}

- (void)dealloc
{
    [collection release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    return [collection containsObject:item];
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"one of "];
    [description appendList:collection start:@"{" separator:@", " end:@"}"];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_isIn(id aCollection)
{
    return [HCIsIn isInCollection:aCollection];
}
