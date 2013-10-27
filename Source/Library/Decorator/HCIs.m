//
//  OCHamcrest - HCIs.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIs.h"

#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIs

+ (instancetype)is:(id <HCMatcher>)aMatcher
{
    return [[self alloc] initWithMatcher:aMatcher];
}

- (instancetype)initWithMatcher:(id <HCMatcher>)aMatcher
{
    self = [super init];
    if (self)
        matcher = aMatcher;
    return self;
}

- (BOOL)matches:(id)item
{
    return [matcher matches:item];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [matcher describeMismatchOf:item to:mismatchDescription];
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendDescriptionOf:matcher];
}

@end


id HC_is(id match)
{
    return [HCIs is:HCWrapInMatcher(match)];
}
