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
    @ingroup number
 */
@interface HCIsCloseTo : HCBaseMatcher
{
    double value;
    double error;
}

+ (id) isCloseTo:(double)aValue within:(double)anError;
- (id) initWithValue:(double)aValue error:(double)anError;

@end


/**
    Is the value a number equal to a value within some range of acceptable error?
 
    @b Synonym: @ref closeTo
    @see HCIsCloseTo
    @ingroup number
*/
OBJC_EXPORT id<HCMatcher> HC_closeTo(double aValue, double anError);

/**
    Synonym for @ref HC_closeTo, available if @c HC_SHORTHAND is defined.
    @ingroup number
*/
#ifdef HC_SHORTHAND
    #define closeTo HC_closeTo
#endif
