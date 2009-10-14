//
//  OCHamcrest - HCHasDescription.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCHasDescription.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCHasDescription

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)theDescriptionMatcher
{
    return [[[HCHasDescription alloc] initWithDescription:theDescriptionMatcher] autorelease];
}


- (id) initWithDescription:(id<HCMatcher>)theDescriptionMatcher;
{
    self = [super init];
    if (self != nil)
        descriptionMatcher = [theDescriptionMatcher retain];
    return self;
}


- (void) dealloc
{
    [descriptionMatcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [descriptionMatcher matches:[item description]];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:@"description("]
                    appendDescriptionOf:descriptionMatcher]
                    appendText:@")"];
}

@end


extern "C" {

id<HCMatcher> HC_hasDescription(id item)
{
    return [HCHasDescription hasDescription:HC_wrapInMatcher(item)];
}

}   // extern "C"
