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
\code
assertThat(cheese, equalTo(smelly))
\endcode
    vs.
\code
assertThat(cheese, is(equalTo(smelly)))
\endcode

    \ingroup core
 */
@interface HCIs : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (HCIs*) is:(id<HCMatcher>)aMatcher;
- (id) initWithMatcher:(id<HCMatcher>)aMatcher;

@end


/**
    Decorates an item, providing shortcuts to the frequently used \ref is(equalTo(x)).
    
    For example:
\code
assertThat(cheese, is(equalTo(smelly)))
\endcode
    vs.
\code
assertThat(cheese, is(smelly))
\endcode

    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_is(id item);

/**
    Shorthand for \ref HC_is, available if HC_SHORTHAND is defined.

    \ingroup core
 */
#ifdef HC_SHORTHAND
    #define is HC_is
#endif
