// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

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
