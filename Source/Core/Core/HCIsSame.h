//
//  OCHamcrest - HCIsSame.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the item the same object as another?
    \ingroup core
*/
@interface HCIsSame : HCBaseMatcher
{
    id object;
}

+ (HCIsSame*) isSameAs:(id)anObject;
- (id) initSameAs:(id)anObject;

@end


/**
    Evaluates to \c YES only when the argument is this same object.
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_sameInstance(id anObject);

/**
    Shorthand for \ref HC_sameInstance, available if HC_SHORTHAND is defined.
    \ingroup core
 */
#ifdef HC_SHORTHAND
    #define sameInstance HC_sameInstance
#endif
