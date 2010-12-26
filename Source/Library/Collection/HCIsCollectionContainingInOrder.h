//
//  OCHamcrest - HCIsCollectionContainingInOrder.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches a collection if its elements, in order, satisfy a list of matchers.
    @ingroup collection_matchers
 */
@interface HCIsCollectionContainingInOrder : HCBaseMatcher
{
    NSArray* matchers;
}

+ (id) isCollectionContainingInOrder:(NSArray*)itemMatchers;
- (id) initWithMatchers:(NSArray*)itemMatchers;

@end


/**
    Matches a collection if its elements, in order, satisfy a list of matchers.
 
    @b Synonym: @ref contains
    @param items  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCIsCollectionContainingInOrder
    @ingroup collection_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_contains(id items, ...);

/**
    Synonym for @ref HC_contains, available if @c HC_SHORTHAND is defined.
    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define contains HC_contains
#endif
