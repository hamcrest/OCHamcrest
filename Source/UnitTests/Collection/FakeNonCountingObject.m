//
//  OCHamcrest - FakeNonCountingObject.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "FakeNonCountingObject.h"


@implementation FakeNonCountingObject

+ (id) fake
{
    return [[[self alloc] init] autorelease];
}


- (NSString *) description
{
    return @"non-counting";
}

@end
