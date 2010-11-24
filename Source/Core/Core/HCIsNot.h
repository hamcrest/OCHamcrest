//
//  OCHamcrest - HCIsNot.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Calculates the logical negation of a matcher.
*/
@interface HCIsNot : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (HCIsNot*) isNot:(id<HCMatcher>)aMatcher;
- (id) initNot:(id<HCMatcher>)aMatcher;

@end


/**
    Inverts the rule, providing a shortcut to the frequently used isNot(equalTo(x)).

    For example:
@code
assertThat(cheese, isNot(equalTo(smelly)))
@endcode
    vs.
@code
assertThat(cheese, isNot(smelly))
@endcode
 */
OBJC_EXPORT id<HCMatcher> HC_isNot(id item);

/**
    Shorthand for HC_isNot, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define isNot HC_isNot
#endif
