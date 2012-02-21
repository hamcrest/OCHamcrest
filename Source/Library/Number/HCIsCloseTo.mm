//
//  OCHamcrest - HCIsCloseTo.mm
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsCloseTo.h"

#import "HCDescription.h"
#import <cmath>
using namespace std;


@implementation HCIsCloseTo

+ (id)isCloseTo:(double)aValue within:(double)aDelta
{
    return [[[self alloc] initWithValue:aValue delta:aDelta] autorelease];
}

- (id)initWithValue:(double)aValue delta:(double)aDelta
{
    self = [super init];
    if (self)
    {
        value = aValue;
        delta = aDelta;
    }
    return self;
}

- (BOOL)matches:(id)item
{
    if (![item isKindOfClass:[NSNumber class]])
        return NO;
    
    return fabs([item doubleValue] - value) <= delta;
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    if (![item isKindOfClass:[NSNumber class]])
        [super describeMismatchOf:item to:mismatchDescription];
    else
    {
        double actualDelta = fabs([item doubleValue] - value);
        [[[mismatchDescription appendDescriptionOf:item]
                               appendText:@" differed by "]
                               appendDescriptionOf:[NSNumber numberWithDouble:actualDelta]];
    }
}

- (void)describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a numeric value within "]
                    appendDescriptionOf:[NSNumber numberWithDouble:delta]]
                    appendText:@" of "]
                    appendDescriptionOf:[NSNumber numberWithDouble:value]];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_closeTo(double value, double delta)
{
    return [HCIsCloseTo isCloseTo:value within:delta];
}
