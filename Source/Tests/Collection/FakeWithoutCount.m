//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

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
