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

    @param aMatcher  The matcher to satisfy, or an expected value for @ref equalTo matching.
    
    The @c hasDescription matcher invokes @c -description on the evaluated object to get its
    description, passing the result to a given matcher for evaluation. If the @c aMatcher argument
    is not a matcher, it is wrapped in an implicit @ref equalTo matcher to check for equality.
    
    Examples:
    @li @ref hasDescription(\@"foo")
    @li @ref hasDescription(@ref startsWith(\@"bar"))

    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasDescription instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define hasDescription(aMatcher)  HC_hasDescription(aMatcher)
#endif
