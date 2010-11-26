//
//  OCHamcrest - HCIsNot.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical negation of a matcher.
    \ingroup core
*/
@interface HCIsNot : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (HCIsNot*) isNot:(id<HCMatcher>)aMatcher;
- (id) initNot:(id<HCMatcher>)aMatcher;

@end


/**
    Inverts the rule, or provides a shortcut to the frequently used isNot(equalTo(value)).

    For example:
\code
assertThat(cheese, isNot(equalTo(smelly)))
\endcode
    vs.
\code
assertThat(cheese, isNot(smelly))
\endcode

    \see HCIsNot
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_isNot(id matcherOrValue);

/**
    Shorthand for \ref HC_isNot, available if HC_SHORTHAND is defined.
    \ingroup core
 */
#ifdef HC_SHORTHAND
    #define isNot HC_isNot
#endif
