//
//  OCHamcrest - HCIsEqual.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsEqual.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation HCIsEqual

+ (HCIsEqual*) isEqualTo:(id)anObject;
{
    return [[[HCIsEqual alloc] initEqualTo:anObject] autorelease];
}


- (id) initEqualTo:(id)anObject
{
    self = [super init];
    if (self != nil)
        object = [anObject retain];
    return self;
}


- (void) dealloc
{
    [object release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    if (item == nil)
        return object == nil;
    else
        return [item isEqual:object];
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendValue:object];
}

@end


OBJC_EXPORT id<HCMatcher> HC_equalTo(id anObject)
{
    return [HCIsEqual isEqualTo:anObject];
}
