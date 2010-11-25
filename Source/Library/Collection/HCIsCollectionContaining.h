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
 
    \a item is a matcher, or an implied HCIsEqual matcher will wrap the item.

    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItem(id item);

/**
    Shorthand for \ref HC_hasItem, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define hasItem HC_hasItem
#endif


/**
    Matches a collection if all matchers are satisfied by any of the elements.
 
    \param item comma-separated list of matchers (or implied HCIsEqual wrapping items) ending with nil.

    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItems(id item, ...);

/**
    Shorthand for \ref HC_hasItems, available if HC_SHORTHAND is defined.

    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasItems HC_hasItems
#endif
