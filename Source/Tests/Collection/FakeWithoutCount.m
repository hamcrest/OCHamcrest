//
//  OCHamcrest - FakeWithoutCount.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "FakeWithoutCount.h"


@implementation FakeWithoutCount

+ (id)fake
{
    return [[self alloc] init];
}

- (NSString *)description
{
    return @"FakeWithoutCount";
}

@end
