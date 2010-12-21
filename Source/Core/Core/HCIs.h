//
//  OCHamcrest - HCIs.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Decorates another HCMatcher, retaining the behavior but allowing tests to be slightly more
    expressive.

    For example:
@code
assertThat(cheese, equalTo(smelly))
@endcode
    vs.
@code
assertThat(cheese, is(equalTo(smelly)))
@endcode

    @ingroup core
 */
@interface HCIs : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (HCIs*) is:(id<HCMatcher>)aMatcher;
- (id) initWithMatcher:(id<HCMatcher>)aMatcher;

@end


/**
    Decorates another matcher, or provides a shortcut to the frequently used @ref is(equalTo(x)).

    If @a matcherOrValue is a matcher, its behavior is retained, but the test may be more expressive.

    If @a matcherOrValue is not a matcher, it is wrapped in an @ref equalTo matcher. This makes the
    following three statements the same:
@code
assertThat(cheese, equalTo(smelly))
assertThat(cheese, is(equalTo(smelly)))
assertThat(cheese, is(smelly))
@endcode
    Choose the style that makes your expression most readable. This will vary depending on context.

    @see HCIs
    @ingroup core

 */
OBJC_EXPORT id<HCMatcher> HC_is(id matcherOrValue);

/**
    Shorthand for @ref HC_is, available if @c HC_SHORTHAND is defined.
    @ingroup core
 */
#ifdef HC_SHORTHAND
    #define is HC_is
#endif
