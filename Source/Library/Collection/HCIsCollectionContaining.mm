//
//  OCHamcrest - HCIsCollectionContaining.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
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
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
        
    for (id item in collection)
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

id<HCMatcher> HC_hasItem(id matcherOrValue)
{
    return [HCIsCollectionContaining isCollectionContaining:HCWrapInMatcher(matcherOrValue)];
}


id<HCMatcher> HC_hasItems(id matcherOrValue, ...)
{
    NSMutableArray* matcherList = [NSMutableArray arrayWithObject:HC_hasItem(matcherOrValue)];
    
    va_list args;
    va_start(args, matcherOrValue);
    matcherOrValue = va_arg(args, id);
    while (matcherOrValue != nil)
    {
        [matcherList addObject:HC_hasItem(matcherOrValue)];
        matcherOrValue = va_arg(args, id);
    }
    va_end(args);
    
    return [HCAllOf allOf:matcherList];
}

}   // extern "C"
