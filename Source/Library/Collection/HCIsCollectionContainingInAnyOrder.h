//
//  OCHamcrest - HCIsCollectionContainingInAnyOrder.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches a collection if its elements, in any order, satisfy a list of matchers.
    @ingroup collection_matchers
 */
@interface HCIsCollectionContainingInAnyOrder : HCBaseMatcher
{
    NSMutableArray* matchers;
}

+ (id) isCollectionContainingInAnyOrder:(NSMutableArray*)itemMatchers;
- (id) initWithMatchers:(NSMutableArray*)itemMatchers;

@end


/**
    Matches a collection if its elements, in any order, satisfy a list of matchers.
 
    @b Synonym: @ref containsInAnyOrder
    @param items  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCIsCollectionContainingInAnyOrder
    @ingroup collection_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_containsInAnyOrder(id items, ...);

/**
    Synonym for @ref HC_containsInAnyOrder, available if @c HC_SHORTHAND is defined.
    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define containsInAnyOrder HC_containsInAnyOrder
#endif
