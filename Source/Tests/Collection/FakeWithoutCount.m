//  OCHamcrest by Jon Reid, https://qualitycoding.org/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

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
