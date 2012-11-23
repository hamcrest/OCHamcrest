//
//  OCHamcrest - FakeWithCount.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "FakeWithCount.h"


@implementation FakeWithCount

@synthesize count;


+ (id)fakeWithCount:(NSUInteger)fakeCount
{
    return [[self alloc] initWithCount:fakeCount];
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
