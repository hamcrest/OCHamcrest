//
//  OCHamcrest - FakeWithCount.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  https://github.com/hamcrest/OCHamcrest
//

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
    if (self)
        count = fakeCount;
    return self;
}

- (NSString *)description
{
    return @"FakeWithCount";
}

@end
