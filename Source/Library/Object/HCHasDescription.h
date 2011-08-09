//
//  OCHamcrest - HCHasDescription.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCInvocationMatcher.h>


@interface HCHasDescription : HCInvocationMatcher

+ (id)hasDescription:(id<HCMatcher>)descriptionMatcher;
- (id)initWithDescription:(id<HCMatcher>)descriptionMatcher;

@end


OBJC_EXPORT id<HCMatcher> HC_hasDescription(id match);

/**
    Matches if object's @c -description satisfies the given matcher.

    @param matcher  Matcher to satisfy, or an expected value for @ref equalTo matching.
    
    The @c hasDescription macro gets an object's description by invoking @c -description, passing
    the result to the given matcher for evaluation. If @c matcher is an  object other than a
    matcher, it is wrapped in an implicit @ref equalTo matcher to check for equality.
    
    Examples:
    @li @ref hasDescription(\@"foo")
    @li @ref hasDescription(@ref startsWith(\@"bar"))

    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasDescription instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define hasDescription(matcher)  HC_hasDescription(matcher)
#endif
