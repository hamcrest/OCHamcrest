//
//  OCHamcrest - HCIsDictionaryContainingKey.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
     Matches dictionaries containing a key satisfying a matcher.

    \ingroup collection
 */
@interface HCIsDictionaryContainingKey : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
}

+ (HCIsDictionaryContainingKey*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher;
- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher;

@end


/**
    Matches dictionaries containing a key satisfying a matcher.

    \a item is a matcher, or an implied HCIsEqual matcher will wrap the item.

    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasKey(id item);

/**
    Shorthand for \ref HC_hasKey, available if HC_SHORTHAND is defined.

    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasKey HC_hasKey
#endif
