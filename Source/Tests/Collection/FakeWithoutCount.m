//  OCHamcrest by Jon Reid, https://qualitycoding.org
//  Copyright 2021 hamcrest. See LICENSE.txt

#import "FakeWithoutCount.h"


@implementation FakeWithoutCount

+ (instancetype)fake
{
    return [[self alloc] init];
}

- (NSString *)description
{
    return @"FakeWithoutCount";
}

@end
