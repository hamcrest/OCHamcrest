//
//  OCHamcrest - HCAllOf.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical conjunction of multiple matchers.

    Evaluation is shortcut, so subsequent matchers are not called if an earlier matcher returns
    @c NO.

    @b Factory: @ref allOf
    @ingroup logical_matchers
 */
@interface HCAllOf : HCBaseMatcher
{
    NSArray *matchers;
}

+ (id)allOf:(NSArray *)theMatchers;
- (id)initWithMatchers:(NSArray *)theMatchers;

@end


#pragma mark -

/**
    Evaluates to @c YES only if @em all of the given matchers evaluate to @c YES.
 
    @b Synonym: @ref allOf
    @param match  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCAllOf
    @ingroup logical_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_allOf(id match, ...);

/**
    Evaluates to @c YES only if @em all of the given matchers evaluate to @c YES.

    Synonym for @ref HC_allOf, available if @c HC_SHORTHAND is defined.
    @param match  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCAllOf
    @ingroup logical_matchers
 */
#ifdef HC_SHORTHAND
    #define allOf(match, ...)  HC_allOf(match, ##__VA_ARGS__)
#endif
