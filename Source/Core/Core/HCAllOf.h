//
//  OCHamcrest - HCAllOf.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical conjunction of multiple matchers.

    Evaluation is shortcut, so subsequent matchers are not called if an earlier matcher returns
    @c NO.

    @ingroup core
 */
@interface HCAllOf : HCBaseMatcher
{
    NSArray* matchers;
}

+ (id) allOf:(NSArray*)theMatchers;
- (id) initWithMatchers:(NSArray*)theMatchers;

@end


/**
    Evaluates to @c YES only if @b all of the passed in matchers evaluate to @c YES.
 
    @b Synonym: @ref allOf
    @param matcher  Comma-separated list of matchers ending with @c nil.
    @see HCAllOf
    @ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_allOf(id<HCMatcher> matcher, ...);

/**
    Synonym for @ref HC_allOf, available if @c HC_SHORTHAND is defined.
    @ingroup core
 */
#ifdef HC_SHORTHAND
    #define allOf HC_allOf
#endif
