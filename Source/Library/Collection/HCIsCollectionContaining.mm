//
//  OCHamcrest - HCIsCollectionContaining.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsCollectionContaining.h"

    // OCHamcrest
#import "HCAllOf.h"
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsCollectionContaining

+ (HCIsCollectionContaining*) isCollectionContaining:(id<HCMatcher>)anElementMatcher
{
    return [[[HCIsCollectionContaining alloc] initWithMatcher:anElementMatcher] autorelease];
}


- (id) initWithMatcher:(id<HCMatcher>)anElementMatcher
{
    self = [super init];
    if (self != nil)
        elementMatcher = [anElementMatcher retain];
    return self;
}


- (void) dealloc
{
    [elementMatcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)collection
{
#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
        
    for (id item in collection)
#else
    if (![collection respondsToSelector:@selector(objectEnumerator)])
        return NO;

    NSEnumerator* enumerator = [collection objectEnumerator];
    id item;
    while ((item = [enumerator nextObject]) != nil)
#endif
    {
        if ([elementMatcher matches:item])
            return YES;
    }
    return NO;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing "]
                    appendDescriptionOf:elementMatcher];
}

@end


extern "C" {

id<HCMatcher> HC_hasItem(id item)
{
    return [HCIsCollectionContaining isCollectionContaining:HC_wrapInMatcher(item)];
}


id<HCMatcher> HC_hasItems(id item, ...)
{
    NSMutableArray* matcherList = [NSMutableArray arrayWithObject:HC_hasItem(item)];
    
    va_list args;
    va_start(args, item);
    item = va_arg(args, id);
    while (item != nil)
    {
        [matcherList addObject:HC_hasItem(item)];
        item = va_arg(args, id);
    }
    va_end(args);
    
    return [HCAllOf allOf:matcherList];
}

}   // extern "C"
