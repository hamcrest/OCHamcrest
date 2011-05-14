//
//  OCHamcrest - HCHasDescription.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCInvocationMatcher.h>


/**
    Does the object's @c -description satisfy a given matcher?

    @b Factory: @ref hasDescription
    @ingroup object_matchers
 */
@interface HCHasDescription : HCInvocationMatcher

+ (id)hasDescription:(id<HCMatcher>)descriptionMatcher;
- (id)initWithDescription:(id<HCMatcher>)descriptionMatcher;

@end


/**
    Evaluates whether [item description] satisfies a given matcher.
    
    Examples:
    @li @ref hasDescription(@ref startsWith(\@"foo"))
    @li @ref hasDescription(\@"bar")

    @b Synonym: @ref hasDescription
    @param match  A matcher, or a value for @ref equalTo matching.
    @see HCHasDescription
    @ingroup object_matchers
*/
OBJC_EXPORT id<HCMatcher> HC_hasDescription(id match);

/**
    hasDescription(match) -
    Evaluates whether [item description] satisfies a given matcher.

    Examples:
    @li @ref hasDescription(@ref startsWith(\@"foo"))
    @li @ref hasDescription(\@"bar")

    Synonym for @ref HC_hasDescription, available if @c HC_SHORTHAND is defined.
    @param match  A matcher, or a value for @ref equalTo matching.
    @see HCHasDescription
    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define hasDescription(match)  HC_hasDescription(match)
#endif
