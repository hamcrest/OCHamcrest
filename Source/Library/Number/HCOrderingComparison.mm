//
//  OCHamcrest - HCOrderingComparison.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
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

+ (HCOrderingComparison*) compare:(id)aValue
                       minCompare:(NSComparisonResult)min
                       maxCompare:(NSComparisonResult)max
{
    return [[[HCOrderingComparison alloc] initComparing:aValue minCompare:min maxCompare:max]
            autorelease];
}


- (id) initComparing:(id)aValue
          minCompare:(NSComparisonResult)min
          maxCompare:(NSComparisonResult)max
{
    if (![aValue respondsToSelector:@selector(compare:)])
    {
        @throw [NSException exceptionWithName: @"UncomparableObject"
                                       reason: @"Object must respond to compare:"
                                     userInfo: nil];
    }
    
    self = [super init];
    if (self != nil)
    {
        value = [aValue retain];
        minCompare = min;
        maxCompare = max;
    }
    return self;
}


- (void) dealloc
{
    [value release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    if (item == nil)
        return NO;
    
    NSComparisonResult compare = [value compare:item];
    return minCompare <= compare && compare <= maxCompare;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a value "] appendText:comparison(minCompare)];
    if (minCompare != maxCompare)
        [[description appendText:@" or "] appendText:comparison(maxCompare)];
    [[description appendText:@" "] appendValue:value];
}

@end


extern "C" {

id<HCMatcher> HC_greaterThan(id aValue)
{
    return [HCOrderingComparison compare: aValue
                              minCompare: NSOrderedAscending
                              maxCompare: NSOrderedAscending];
}

id<HCMatcher> HC_greaterThanOrEqualTo(id aValue)
{
    return [HCOrderingComparison compare: aValue
                              minCompare: NSOrderedAscending
                              maxCompare: NSOrderedSame];
}

id<HCMatcher> HC_lessThan(id aValue)
{
    return [HCOrderingComparison compare: aValue
                              minCompare: NSOrderedDescending
                              maxCompare: NSOrderedDescending];
}

id<HCMatcher> HC_lessThanOrEqualTo(id aValue)
{
    return [HCOrderingComparison compare: aValue
                              minCompare: NSOrderedSame
                              maxCompare: NSOrderedDescending];
}

}   // extern "C"
