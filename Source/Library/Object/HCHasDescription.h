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
    @ingroup object
 */
@interface HCHasDescription : HCInvocationMatcher
{
}

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)descriptionMatcher;
- (id) initWithDescription:(id<HCMatcher>)descriptionMatcher;

@end


/**
    Evaluates whether [item description] satisfies a given matcher.
    
    Examples:
    @li @ref hasDescription(@ref startsWith(\@"foo"))
    @li @ref hasDescription(\@"bar")

    @param matcherOrValue  A matcher, or a value for @ref equalTo matching.
    @see HCHasDescription
    @ingroup object
*/
OBJC_EXPORT id<HCMatcher> HC_hasDescription(id matcherOrValue);

/**
    Shorthand for @ref HC_hasDescription, available if @c HC_SHORTHAND is defined.
    @ingroup object
 */
#ifdef HC_SHORTHAND
    #define hasDescription HC_hasDescription
#endif
