//
//  OCHamcrest - FakeWithoutCount.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  https://github.com/hamcrest/OCHamcrest
//

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
