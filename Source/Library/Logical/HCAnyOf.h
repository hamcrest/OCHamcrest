//
//  OCHamcrest - HCAnyOf.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCAnyOf : HCBaseMatcher
{
    NSArray *matchers;
}

+ (id)anyOf:(NSArray *)theMatchers;
- (id)initWithMatchers:(NSArray *)theMatchers;

@end


OBJC_EXPORT id<HCMatcher> HC_anyOf(id match, ...);

/**
    Matches if any of the given matchers evaluate to @c YES.
    
    @param firstMatcher,...  A comma-separated list of matchers ending with @c nil.
    
    The matchers are evaluated from left to right using short-circuit evaluation, so evaluation
    stops as soon as a matcher returns @c YES.

    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_anyOf instead.)

    @ingroup logical_matchers
 */
#ifdef HC_SHORTHAND
    #define anyOf(firstMatcher, ...)  HC_anyOf(firstMatcher, ##__VA_ARGS__)
#endif
