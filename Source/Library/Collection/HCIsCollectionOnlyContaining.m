//
//  OCHamcrest - HCIsCollectionOnlyContaining.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsCollectionOnlyContaining.h"

#import "HCAnyOf.h"
#import "HCCollect.h"


@implementation HCIsCollectionOnlyContaining

+ (instancetype)isCollectionOnlyContaining:(id <HCMatcher>)aMatcher
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

- (BOOL)matches:(id)collection
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
    
    if ([collection count] == 0)
        return NO;
    
    for (id item in collection)
        if (![matcher matches:item])
            return NO;
    return YES;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing items matching "]
                  appendDescriptionOf:matcher];
}

@end


id HC_onlyContains(id itemMatch, ...)
{
    va_list args;
    va_start(args, itemMatch);
    NSArray *matchers = HCCollectMatchers(itemMatch, args);
    va_end(args);

    return [HCIsCollectionOnlyContaining isCollectionOnlyContaining:[HCAnyOf anyOf:matchers]];
}
