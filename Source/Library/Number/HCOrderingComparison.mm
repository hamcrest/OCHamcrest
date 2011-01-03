//
//  OCHamcrest - HCOrderingComparison.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCOrderingComparison.h"

    // OCHamcrest
#import "HCDescription.h"


namespace {

NSString* comparison(NSComparisonResult compare)
{
    if (compare == NSOrderedDescending)
        return @"less than";
    else if (compare == NSOrderedSame)
        return @"equal to";
    else
        return @"greater than";
}

}   // namespace


@implementation HCOrderingComparison

+ (id) compare:(id)expectedValue
    minCompare:(NSComparisonResult)min
    maxCompare:(NSComparisonResult)max
{
    return [[[self alloc] initComparing:expectedValue minCompare:min maxCompare:max] autorelease];
}


- (id) initComparing:(id)expectedValue
          minCompare:(NSComparisonResult)min
          maxCompare:(NSComparisonResult)max
{
    if (![expectedValue respondsToSelector:@selector(compare:)])
    {
        @throw [NSException exceptionWithName: @"UncomparableObject"
                                       reason: @"Object must respond to compare:"
                                     userInfo: nil];
    }
    
    self = [super init];
    if (self != nil)
    {
        expected = [expectedValue retain];
        minCompare = min;
        maxCompare = max;
    }
    return self;
}


- (void) dealloc
{
    [expected release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    if (item == nil)
        return NO;
    
    NSComparisonResult compare = [expected compare:item];
    return minCompare <= compare && compare <= maxCompare;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a value "] appendText:comparison(minCompare)];
    if (minCompare != maxCompare)
        [[description appendText:@" or "] appendText:comparison(maxCompare)];
    [[description appendText:@" "] appendDescriptionOf:expected];
}

@end


OBJC_EXPORT id<HCMatcher> HC_greaterThan(id aValue)
{
    return [HCOrderingComparison compare:aValue
                              minCompare:NSOrderedAscending
                              maxCompare:NSOrderedAscending];
}

OBJC_EXPORT id<HCMatcher> HC_greaterThanOrEqualTo(id aValue)
{
    return [HCOrderingComparison compare:aValue
                              minCompare:NSOrderedAscending
                              maxCompare:NSOrderedSame];
}

OBJC_EXPORT id<HCMatcher> HC_lessThan(id aValue)
{
    return [HCOrderingComparison compare:aValue
                              minCompare:NSOrderedDescending
                              maxCompare:NSOrderedDescending];
}

OBJC_EXPORT id<HCMatcher> HC_lessThanOrEqualTo(id aValue)
{
    return [HCOrderingComparison compare:aValue
                              minCompare:NSOrderedSame
                              maxCompare:NSOrderedDescending];
}
