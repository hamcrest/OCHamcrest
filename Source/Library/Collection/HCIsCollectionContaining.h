//
//  OCHamcrest - HCIsCollectionContaining.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches a collection if any element satisfies a given matcher.
    \ingroup collection
 */
@interface HCIsCollectionContaining : HCBaseMatcher
{
    id<HCMatcher> elementMatcher;
}

+ (HCIsCollectionContaining*) isCollectionContaining:(id<HCMatcher>)anElementMatcher;
- (id) initWithMatcher:(id<HCMatcher>)anElementMatcher;

@end


/**
    Matches a collection if any element satifies a given matcher.
    \param matcherOrValue  A matcher, or an implied HCIsEqual matcher wrapping a value.
    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItem(id matcherOrValue);

/**
    Shorthand for \ref HC_hasItem, available if HC_SHORTHAND is defined.
    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasItem HC_hasItem
#endif


/**
    Matches a collection if all matchers are satisfied by any of the elements.
    \param matcherOrValue  Comma-separated list of matchers - or values wrapped in implied HCIsEqual - ending with \c nil.
    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItems(id matcherOrValue, ...);

/**
    Shorthand for \ref HC_hasItems, available if HC_SHORTHAND is defined.
    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasItems HC_hasItems
#endif
