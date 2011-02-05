//
//  OCHamcrest - HCIsCollectionContainingInOrder.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsCollectionContainingInOrder.h"

    // OCHamcrest
#import "HCAllOf.h"
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@interface HCMatchSequence : NSObject
{
    NSArray *matchers;
    id<HCDescription, NSObject> mismatchDescription;
    NSUInteger nextMatchIndex;
}

- (BOOL)isMatched:(id)item;
- (BOOL)isNotSurplus:(id)item;
- (void)describeMismatchOfMatcher:(id<HCMatcher>)matcher item:(id)item;

@end

@implementation HCMatchSequence

- (id)initWithMatchers:(NSArray *)itemMatchers mismatchDescription:(id<HCDescription, NSObject>)description
{
    self = [super init];
    if (self != nil)
    {
        matchers = [itemMatchers retain];
        mismatchDescription = [description retain];        
    }
    return self;
}


- (void)dealloc
{
    [matchers release];
    [mismatchDescription release];
    
    [super dealloc];
}


- (BOOL)matches:(id)item
{
    return [self isNotSurplus:item] && [self isMatched:item];
}


- (BOOL)isFinished
{
    if (nextMatchIndex < [matchers count])
    {
        [[mismatchDescription appendText:@"no item matched: "]
                              appendDescriptionOf:[matchers objectAtIndex:nextMatchIndex]];
        return NO;
    }
    return YES;
}


- (BOOL)isMatched:(id)item
{
    id<HCMatcher> matcher = [matchers objectAtIndex:nextMatchIndex];
    if (![matcher matches:item])
    {
        [self describeMismatchOfMatcher:matcher item:item];
        return NO;
    }
    ++nextMatchIndex;
    return YES;
}


- (BOOL)isNotSurplus:(id)item
{
    if ([matchers count] <= nextMatchIndex)
    {
        [[mismatchDescription appendText:@"not matched: "] appendDescriptionOf:item];
        return NO;
    }
    return YES;
}



- (void)describeMismatchOfMatcher:(id<HCMatcher>)matcher item:(id)item
{
    [mismatchDescription appendText:[NSString stringWithFormat:@"item %d: ", nextMatchIndex]];
    [matcher describeMismatchOf:item to:mismatchDescription];
}

@end

//--------------------------------------------------------------------------------------------------

@implementation HCIsCollectionContainingInOrder

+ (id)isCollectionContainingInOrder:(NSArray *)itemMatchers;
{
    return [[[self alloc] initWithMatchers:itemMatchers] autorelease];
}


- (id)initWithMatchers:(NSArray *)itemMatchers;
{
    self = [super init];
    if (self != nil)
        matchers = [itemMatchers retain];
    return self;
}


- (void)dealloc
{
    [matchers release];
    [super dealloc];
}


- (BOOL)matches:(id)collection
{
    return [self matches:collection describingMismatchTo:nil];
}


- (BOOL)matches:(id)collection describingMismatchTo:(id<HCDescription, NSObject>)mismatchDescription
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
    {
        [super describeMismatchOf:collection to:mismatchDescription];
        return NO;
    }
    
    HCMatchSequence *matchSequence =
        [[[HCMatchSequence alloc] initWithMatchers:matchers
                               mismatchDescription:mismatchDescription] autorelease];
    for (id item in collection)
    {
        if (![matchSequence matches:item])
            return NO;
    }
    return [matchSequence isFinished];
}


- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    (void) [self matches:item describingMismatchTo:mismatchDescription];
}


- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a collection containing "]
                    appendList:matchers start:@"[" separator:@", " end:@"]"];
}

@end

//--------------------------------------------------------------------------------------------------

OBJC_EXPORT id<HCMatcher> HC_contains(id items, ...)
{
    NSMutableArray *matchers = [NSMutableArray arrayWithObject:HCWrapInMatcher(items)];
    
    va_list args;
    va_start(args, items);
    items = va_arg(args, id);
    while (items != nil)
    {
        [matchers addObject:HCWrapInMatcher(items)];
        items = va_arg(args, id);
    }
    va_end(args);
    
    return [HCIsCollectionContainingInOrder isCollectionContainingInOrder:matchers];
}
