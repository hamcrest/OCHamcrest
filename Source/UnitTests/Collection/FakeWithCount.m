//
//  OCHamcrest - FakeWithCount.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "FakeWithCount.h"


@implementation FakeWithCount

@synthesize count;


+ (id)fakeWithCount:(NSUInteger)fakeCount
{
    return [[[self alloc] initWithCount:fakeCount] autorelease];
}


- (id)initWithCount:(NSUInteger)fakeCount
{
    self = [super init];
    if (self != nil)
    {
        count = fakeCount;
    }
    return self;
}


- (NSString *)description
{
    return @"FakeWithCount";
}

@end
