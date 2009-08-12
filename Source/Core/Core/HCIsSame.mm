//
//  OCHamcrest - HCIsSame.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsSame.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation HCIsSame

+ (HCIsSame*) isSameAs:(id)anObject;
{
    return [[[HCIsSame alloc] initSameAs:anObject] autorelease];
}


- (id) initSameAs:(id)anObject
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
    return item == object;
}


- (void) describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [[mismatchDescription appendText:@"was "] appendValue:item];
    [mismatchDescription appendText:[NSString stringWithFormat:@": 0x%0x", item]];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:@"sameInstance("]
                    appendValue:object]
                    appendText:@")"];
}

@end


extern "C" {

id<HCMatcher> HC_sameInstance(id anObject)
{
    return [HCIsSame isSameAs:anObject];
}

}   // extern "C"
