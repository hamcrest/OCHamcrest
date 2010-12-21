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
    @ingroup collection
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
    @param item  A matcher, or a value for @ref equalTo matching.
    @see HCIsCollectionContaining
    @ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItem(id item);

/**
    Shorthand for @ref HC_hasItem, available if HC_SHORTHAND is defined.
    @ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasItem HC_hasItem
#endif


/**
    Matches a collection if all matchers are satisfied by any of the collection's elements.
    @param items  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCIsCollectionContaining
    @ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasItems(id items, ...);

/**
    Shorthand for @ref HC_hasItems, available if HC_SHORTHAND is defined.
    @ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasItems HC_hasItems
#endif
