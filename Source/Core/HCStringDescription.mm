//
//  OCHamcrest - HCStringDescription.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCStringDescription.h"

    // OCHamcrest
#import "HCSelfDescribing.h"


@implementation HCStringDescription

+ (NSString*) stringFrom:(id<HCSelfDescribing>)selfDescribing
{
    HCStringDescription* description = [HCStringDescription stringDescription];
    [description appendDescriptionOf:selfDescribing];
    return [description description];
}


+ (HCStringDescription*) stringDescription
{
    return [[[HCStringDescription alloc] init] autorelease];
}


- (id) init
{
    self = [super init];
    if (self != nil)
        accumulator = [[NSMutableString alloc] init];
    return self;
}


- (void) dealloc
{
    [accumulator release];
    
    [super dealloc];
}


- (NSString*) description
{
    return accumulator;
}


- (void) append:(NSString*)str
{
    [accumulator appendString:str];
}

@end
