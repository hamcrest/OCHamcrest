//
//  OCHamcrest - FakeWithoutCount.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "FakeWithoutCount.h"


@implementation FakeWithoutCount

+ (id)fake
{
    return [[[self alloc] init] autorelease];
}


- (NSString *)description
{
    return @"FakeWithoutCount";
}

@end
