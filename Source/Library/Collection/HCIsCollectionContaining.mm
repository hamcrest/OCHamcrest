//
//  OCHamcrest - HCIsCollectionContaining.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsCollectionContaining.h"

#import "HCAllOf.h"
#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCIsCollectionContaining

+ (id)isCollectionContaining:(id<HCMatcher>)anElementMatcher
{
    return [[[self alloc] initWithMatcher:anElementMatcher] autorelease];
}


- (id)initWithMatcher:(id<HCMatcher>)anElementMatcher
{
    self = [super init];
    if (self != nil)
        elementMatcher = [anElementMatcher retain];
    return self;
}


- (void)dealloc
{
    [elementMatcher release];
    [super dealloc];
}


- (BOOL)matches:(id)collection
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
        
    for (id item in collection)
    {
        if ([elementMatcher matches:item])
            return YES;
    }
    return NO;
}


- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing "]
                  appendDescriptionOf:elementMatcher];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_hasItem(id item)
{
    HCRequireNonNilObject(item);
    return [HCIsCollectionContaining isCollectionContaining:HCWrapInMatcher(item)];
}


OBJC_EXPORT id<HCMatcher> HC_hasItems(id items, ...)
{
    NSMutableArray *matchers = [NSMutableArray arrayWithObject:HC_hasItem(items)];
    
    va_list args;
    va_start(args, items);
    items = va_arg(args, id);
    while (items != nil)
    {
        [matchers addObject:HC_hasItem(items)];
        items = va_arg(args, id);
    }
    va_end(args);
    
    return [HCAllOf allOf:matchers];
}
