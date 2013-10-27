//
//  OCHamcrest - HCIsCollectionContaining.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsCollectionContaining.h"

#import "HCAllOf.h"
#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCIsCollectionContaining

+ (instancetype)isCollectionContaining:(id <HCMatcher>)anElementMatcher
{
    return [[self alloc] initWithMatcher:anElementMatcher];
}

- (instancetype)initWithMatcher:(id <HCMatcher>)anElementMatcher
{
    self = [super init];
    if (self)
        elementMatcher = anElementMatcher;
    return self;
}

- (BOOL)matches:(id)collection
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
        
    for (id item in collection)
        if ([elementMatcher matches:item])
            return YES;
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing "]
                  appendDescriptionOf:elementMatcher];
}

@end


id HC_hasItem(id itemMatch)
{
    HCRequireNonNilObject(itemMatch);
    return [HCIsCollectionContaining isCollectionContaining:HCWrapInMatcher(itemMatch)];
}

id HC_hasItems(id itemMatch, ...)
{
    NSMutableArray *matchers = [NSMutableArray arrayWithObject:HC_hasItem(itemMatch)];
    
    va_list args;
    va_start(args, itemMatch);
    itemMatch = va_arg(args, id);
    while (itemMatch != nil)
    {
        [matchers addObject:HC_hasItem(itemMatch)];
        itemMatch = va_arg(args, id);
    }
    va_end(args);
    
    return [HCAllOf allOf:matchers];
}
