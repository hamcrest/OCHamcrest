//
//  OCHamcrest - HCOrderingComparison.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCOrderingComparison : HCBaseMatcher
{
    id expected;
    NSComparisonResult minCompare;
    NSComparisonResult maxCompare;
    NSString *comparisonDescription;
}

+ (id)compare:(id)expectedValue
   minCompare:(NSComparisonResult)min
   maxCompare:(NSComparisonResult)max
   comparisonDescription:(NSString *)comparisonDescription;

- (id)initComparing:(id)expectedValue
         minCompare:(NSComparisonResult)min
         maxCompare:(NSComparisonResult)max
         comparisonDescription:(NSString *)comparisonDescription;

@end


OBJC_EXPORT id<HCMatcher> HC_greaterThan(id expected);

/**
    Matches if object is greater than a given number.
    
    @param aNumber  The @c NSNumber to compare against.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_greaterThan instead.)

    @ingroup number_matchers
 */
#ifdef HC_SHORTHAND
    #define greaterThan(aNumber) HC_greaterThan(aNumber)
#endif


OBJC_EXPORT id<HCMatcher> HC_greaterThanOrEqualTo(id expected);

/**
    Matches if object is greater than or equal to a given number.
    
    @param aNumber  The @c NSNumber to compare against.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_greaterThanOrEqualTo instead.)

    @ingroup number_matchers
 */
#ifdef HC_SHORTHAND
    #define greaterThanOrEqualTo(aNumber) HC_greaterThanOrEqualTo(aNumber)
#endif


OBJC_EXPORT id<HCMatcher> HC_lessThan(id expected);

/**
    Matches if object is less than a given number.
    
    @param aNumber  The @c NSNumber to compare against.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_lessThan instead.)

    @ingroup number_matchers
 */
#ifdef HC_SHORTHAND
    #define lessThan HC_lessThan
#endif


OBJC_EXPORT id<HCMatcher> HC_lessThanOrEqualTo(id expected);

/**
    Matches if object is less than or equal to a given number.
    
    @param aNumber  The @c NSNumber to compare against.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_lessThanOrEqualTo instead.)

    @ingroup number_matchers
 */
#ifdef HC_SHORTHAND
    #define lessThanOrEqualTo HC_lessThanOrEqualTo
#endif
