//
//  OCHamcrest - FakeCountingObject.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "FakeCountingObject.h"


@implementation FakeCountingObject

@synthesize count;

+ (id) fakeWithCount:(NSUInteger)fakeCount
{
    return [[[self alloc] initWithCount:fakeCount] autorelease];
}


- (id) initWithCount:(NSUInteger)fakeCount
{
    self = [super init];
    if (self != nil)
    {
        count = fakeCount;
    }
    return self;
}


- (NSString *) description
{
    return @"counting";
}

@end
