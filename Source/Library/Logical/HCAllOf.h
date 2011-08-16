//
//  OCHamcrest - HCAllOf.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCAllOf : HCBaseMatcher
{
    NSArray *matchers;
}

+ (id)allOf:(NSArray *)theMatchers;
- (id)initWithMatchers:(NSArray *)theMatchers;

@end


OBJC_EXPORT id<HCMatcher> HC_allOf(id match, ...);

/**
    Matches if all of the given matchers evaluate to @c YES.
    
    @param firstMatcher,...  A comma-separated list of matchers ending with @c nil.
    
    The matchers are evaluated from left to right using short-circuit evaluation, so evaluation
    stops as soon as a matcher returns @c NO.

    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_allOf instead.)

    @ingroup logical_matchers
 */
#ifdef HC_SHORTHAND
    #define allOf(firstMatcher, ...)  HC_allOf(firstMatcher, ##__VA_ARGS__)
#endif
