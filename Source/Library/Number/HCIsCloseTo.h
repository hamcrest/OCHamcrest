//
//  OCHamcrest - HCIsCloseTo.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsCloseTo : HCBaseMatcher
{
    double value;
    double delta;
}

+ (id)isCloseTo:(double)aValue within:(double)aDelta;
- (id)initWithValue:(double)aValue delta:(double)aDelta;

@end


OBJC_EXPORT id<HCMatcher> HC_closeTo(double aValue, double aDelta);

/**
    Matches if object is a number close to a given value, within a given delta.
    
    @param aValue   The double value to compare against as the expected value.
    @param aDelta   The double maximum delta between the values for which the numbers are considered close.
    
    This matcher invokes @c -doubleValue on the evaluated object to get its value as a double. The
    result is compared against @a aValue to see if the difference is within a positive @a aDelta.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_closeTo instead.)

    @ingroup number_matchers
 */
#ifdef HC_SHORTHAND
    #define closeTo(value, delta) HC_closeTo(value, delta)
#endif
