//
//  OCHamcrest - HCIsCloseTo.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsCloseTo.h"

    // OCHamcrest
#import "HCDescription.h"

    // C++
#import <cmath>
using namespace std;


@implementation HCIsCloseTo

+ (id) isCloseTo:(double)aValue within:(double)anError
{
    return [[[self alloc] initWithValue:aValue error:anError] autorelease];
}


- (id) initWithValue:(double)aValue error:(double)anError
{
    self = [super init];
    if (self != nil)
    {
        value = aValue;
        error = anError;
    }
    return self;
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(doubleValue)])
        return NO;
    
    return abs([item doubleValue] - value) <= error;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a numeric value within "]
                    appendDescriptionOf:[NSNumber numberWithDouble:error]]
                    appendText:@" of "]
                    appendDescriptionOf:[NSNumber numberWithDouble:value]];
}

@end


OBJC_EXPORT id<HCMatcher> HC_closeTo(double aValue, double anError)
{
    return [HCIsCloseTo isCloseTo:aValue within:anError];
}
