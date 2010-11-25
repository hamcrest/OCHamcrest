//
//  OCHamcrest - HCIsIn.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the object contained in the collection?

    \ingroup collection
 */
@interface HCIsIn : HCBaseMatcher
{
    id collection;
}

+ (HCIsIn*) isInCollection:(id)aCollection;
- (id) initWithCollection:(id)aCollection;

@end


/**
    Is the object contained in the given collection?

    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_isIn(id collection);

/**
    Shorthand for \ref HC_isIn, available if HC_SHORTHAND is defined.

    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define isIn HC_isIn
#endif
