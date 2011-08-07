//
//  OCHamcrest - HCAnyOf.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical disjunction of multiple matchers.

    Evaluation is shortcut, so the subsequent matchers are not called if an earlier matcher returns
    @c YES.

    @b Factory: @ref anyOf
    @ingroup logical_matchers
 */
@interface HCAnyOf : HCBaseMatcher
{
    NSArray *matchers;
}

+ (id)anyOf:(NSArray *)theMatchers;
- (id)initWithMatchers:(NSArray *)theMatchers;

@end


#pragma mark -

/**
    Evaluates to @c YES if @em any of the given matchers evaluate to @c YES.
 
    @b Synonym: @ref anyOf
    @param match  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCAnyOf
    @ingroup logical_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_anyOf(id match, ...);

/**
    Evaluates to @c YES if @em any of the given matchers evaluate to @c YES.
 
    Synonym for @ref HC_anyOf, available if @c HC_SHORTHAND is defined.
    @param match  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCAnyOf
    @ingroup logical_matchers
 */
#ifdef HC_SHORTHAND
    #define anyOf(match, ...)  HC_anyOf(match, ##__VA_ARGS__)
#endif
