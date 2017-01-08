//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "FakeWithCount.h"


@implementation FakeWithCount

+ (instancetype)fakeWithCount:(NSUInteger)fakeCount
{
    return [[self alloc] initWithCount:fakeCount];
}

- (instancetype)initWithCount:(NSUInteger)fakeCount
{
    self = [super init];
    if (self)
        _count = fakeCount;
    return self;
}

- (NSString *)description
{
    return @"FakeWithCount";
}

@end
