//
//  OCHamcrest - HCIsCollectionOnlyContaining.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsCollectionOnlyContaining.h"

#import "HCAnyOf.h"
#import "HCCollect.h"


@interface HCIsCollectionOnlyContaining ()
@property (readonly, nonatomic, strong) id <HCMatcher> matcher;
@end

@implementation HCIsCollectionOnlyContaining

+ (instancetype)isCollectionOnlyContaining:(id <HCMatcher>)matcher
{
    return [[self alloc] initWithMatcher:matcher];
}

- (instancetype)initWithMatcher:(id <HCMatcher>)matcher
{
    self = [super init];
    if (self)
        _matcher = matcher;
    return self;
}

- (BOOL)matches:(id)collection describingMismatchTo:(id <HCDescription>)mismatchDescription
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
    {
        [[mismatchDescription appendText:@"was non-collection "] appendDescriptionOf:collection];
        return NO;
    }

    if ([collection count] == 0)
    {
        [mismatchDescription appendText:@"was empty"];
        return NO;
    }

    for (id item in collection)
    {
        if (![self.matcher matches:item])
        {
            [self describeAllMismatchesInCollection:collection to:mismatchDescription];
            return NO;
        }
    }
    return YES;
}

- (void)describeAllMismatchesInCollection:(id)collection to:(id <HCDescription>)mismatchDescription
{
    [mismatchDescription appendText:@"mismatches were: ["];
    BOOL isPastFirst = NO;
    for (id item in collection)
    {
        if (![self.matcher matches:item])
        {
            if (isPastFirst)
                [mismatchDescription appendText:@", "];
            [self.matcher describeMismatchOf:item to:mismatchDescription];
            isPastFirst = YES;
        }
    }
    [mismatchDescription appendText:@"]"];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing items matching "]
                  appendDescriptionOf:self.matcher];
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
