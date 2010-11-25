//
//  OCHamcrest - HCIsCloseTo.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the value a number equal to a value within some range of acceptable error?

    \ingroup number
 */
@interface HCIsCloseTo : HCBaseMatcher
{
    double value;
    double error;
}

+ (HCIsCloseTo*) isCloseTo:(double)aValue within:(double)anError;
- (id) initWithValue:(double)aValue error:(double)anError;

@end


/**
    Is the value a number equal to a value within some range of acceptable error?

    \ingroup number
*/
OBJC_EXPORT id<HCMatcher> HC_closeTo(double aValue, double anError);

/**
    Shorthand for \ref HC_closeTo, available if HC_SHORTHAND is defined.

    \ingroup number
*/
#ifdef HC_SHORTHAND
    #define closeTo HC_closeTo
#endif
