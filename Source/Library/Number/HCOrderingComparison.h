//
//  OCHamcrest - HCOrderingComparison.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


@interface HCOrderingComparison : HCBaseMatcher
{
    id expected;
    NSComparisonResult minCompare;
    NSComparisonResult maxCompare;
}

+ (HCOrderingComparison*) compare:(id)expectedValue
                       minCompare:(NSComparisonResult)min
                       maxCompare:(NSComparisonResult)max;
- (id) initComparing:(id)expectedValue
          minCompare:(NSComparisonResult)min
          maxCompare:(NSComparisonResult)max;

@end


/**
    Is value > expected?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_greaterThan(id expected);

/**
    Shorthand for @ref HC_greaterThan, available if @c HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define greaterThan HC_greaterThan
#endif


/**
    Is value >= expected?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_greaterThanOrEqualTo(id expected);

/**
    Shorthand for @ref HC_greaterThan, available if @c HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define greaterThanOrEqualTo HC_greaterThanOrEqualTo
#endif


/**
    Is value < expected?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_lessThan(id expected);

/**
    Shorthand for @ref HC_greaterThan, available if @c HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define lessThan HC_lessThan
#endif


/**
    Is value <= expected?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_lessThanOrEqualTo(id expected);

/**
    Shorthand for @ref HC_lessThanOrEqualTo, available if @c HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define lessThanOrEqualTo HC_lessThanOrEqualTo
#endif
