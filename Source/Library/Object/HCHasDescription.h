//
//  OCHamcrest - HCHasDescription.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCInvocationMatcher.h>


/**
    Does the object's @c -description satisfy a given matcher?
    @ingroup object_matchers
 */
@interface HCHasDescription : HCInvocationMatcher
{
}

+ (id) hasDescription:(id<HCMatcher>)descriptionMatcher;
- (id) initWithDescription:(id<HCMatcher>)descriptionMatcher;

@end


/**
    Evaluates whether [item description] satisfies a given matcher.
    
    Examples:
    @li @ref hasDescription(@ref startsWith(\@"foo"))
    @li @ref hasDescription(\@"bar")

    @b Synonym: @ref hasDescription
    @param matcherOrValue  A matcher, or a value for @ref equalTo matching.
    @see HCHasDescription
    @ingroup object_matchers
*/
OBJC_EXPORT id<HCMatcher> HC_hasDescription(id matcherOrValue);

/**
    Synonym for @ref HC_hasDescription, available if @c HC_SHORTHAND is defined.
    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define hasDescription HC_hasDescription
#endif
