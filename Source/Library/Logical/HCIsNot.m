//
//  OCHamcrest - HCIsNot.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsNot.h"

#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsNot

+ (instancetype)isNot:(id <HCMatcher>)aMatcher
{
    return [[self alloc] initNot:aMatcher];
}

- (instancetype)initNot:(id <HCMatcher>)aMatcher
{
    self = [super init];
    if (self)
        matcher = aMatcher;
    return self;
}

- (BOOL)matches:(id)item
{
    return ![matcher matches:item];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"not "] appendDescriptionOf:matcher];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [matcher describeMismatchOf:item to:mismatchDescription];
}
@end


id HC_isNot(id aMatcher)
{
    return [HCIsNot isNot:HCWrapInMatcher(aMatcher)];
}
