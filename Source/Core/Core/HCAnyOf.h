//
//  OCHamcrest - HCAnyOf.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical disjunction of multiple matchers.

    Evaluation is shortcut, so the subsequent matchers are not called if an earlier matcher returns
    \c YES.

    \ingroup core
 */
@interface HCAnyOf : HCBaseMatcher
{
    NSArray* matchers;
}

+ (HCAnyOf*) anyOf:(NSArray*)theMatchers;
- (id) initWithMatchers:(NSArray*)theMatchers;

@end


/**
    Evaluates to \c YES if \b any of the passed in matchers evaluate to \c YES.
    \param matcher  Comma-separated list of matchers ending with \c nil.
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_anyOf(id<HCMatcher> matcher, ...);

/**
    Shorthand for \ref HC_anyOf, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define anyOf HC_anyOf
#endif
