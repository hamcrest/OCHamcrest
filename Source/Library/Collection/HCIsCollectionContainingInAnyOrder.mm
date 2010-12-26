//
//  OCHamcrest - HCIsCollectionContainingInAnyOrder.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsCollectionContainingInAnyOrder.h"

    // OCHamcrest
#import "HCAllOf.h"
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@interface HCMatchingInAnyOrder : NSObject
{
    NSMutableArray* matchers;
    id<HCDescription, NSObject> mismatchDescription;
}

- (BOOL) isMatched:(id)item;
- (BOOL) isNotSurplus:(id)item;

@end

@implementation HCMatchingInAnyOrder

- (id) initWithMatchers:(NSMutableArray *)itemMatchers
    mismatchDescription:(id<HCDescription, NSObject>)description
{
    self = [super init];
    if (self != nil)
    {
        matchers = [itemMatchers retain];
        mismatchDescription = [description retain];        
    }
    return self;
}


- (void) dealloc
{
    [matchers release];
    [mismatchDescription release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [self isNotSurplus:item] && [self isMatched:item];
}


- (BOOL) isFinishedWith:(NSArray*)collection
{
    if ([matchers count] == 0)
        return YES;
    
    [[[[mismatchDescription appendText:@"No item matches: "]
                            appendList:matchers start:@"" separator:@", " end:@""]
                            appendText:@" in "]
                            appendList:collection start:@"[" separator:@", " end:@"]"];
    return NO;
}


- (BOOL) isNotSurplus:(id)item
{
    if ([matchers count] == 0)
    {
        [[mismatchDescription appendText:@"Not matched: "] appendValue:item];
        return NO;
    }
    return YES;
}


- (BOOL) isMatched:(id)item
{
    NSUInteger index = 0;
    for (id<HCMatcher> matcher in matchers)
    {
        if ([matcher matches:item])
        {
            [matchers removeObjectAtIndex:index];
            return YES;
        }
        ++index;
    }
    [[mismatchDescription appendText:@"Not matched: "] appendValue:item];
    return NO;
}

@end


@implementation HCIsCollectionContainingInAnyOrder

+ (id) isCollectionContainingInAnyOrder:(NSMutableArray*)itemMatchers;
{
    return [[[self alloc] initWithMatchers:itemMatchers] autorelease];
}


- (id) initWithMatchers:(NSMutableArray*)itemMatchers;
{
    self = [super init];
    if (self != nil)
        matchers = [itemMatchers retain];
    return self;
}


- (void) dealloc
{
    [matchers release];
    
    [super dealloc];
}


- (BOOL) matches:(id)collection
{
    return [self matches:collection describingMismatchTo:nil];
}


- (BOOL) matches:(id)collection describingMismatchTo:(id<HCDescription, NSObject>)mismatchDescription
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
        return NO;
    
    HCMatchingInAnyOrder *matchSequence = [[[HCMatchingInAnyOrder alloc] initWithMatchers:matchers
                                                                      mismatchDescription:mismatchDescription] autorelease];
    for (id item in collection)
    {
        if (![matchSequence matches:item])
            return NO;
    }
    return [matchSequence isFinishedWith:collection];
}


- (void) describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    (void) [self matches:item describingMismatchTo:mismatchDescription];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:@"collection over "]
                   appendList:matchers start:@"[" separator:@", " end:@"]"]
                   appendText:@" in any order"];
}

@end


OBJC_EXPORT id<HCMatcher> HC_containsInAnyOrder(id items, ...)
{
    NSMutableArray* matchers = [NSMutableArray arrayWithObject:HCWrapInMatcher(items)];
    
    va_list args;
    va_start(args, items);
    items = va_arg(args, id);
    while (items != nil)
    {
        [matchers addObject:HCWrapInMatcher(items)];
        items = va_arg(args, id);
    }
    va_end(args);
    
    return [HCIsCollectionContainingInAnyOrder isCollectionContainingInAnyOrder:matchers];
}
