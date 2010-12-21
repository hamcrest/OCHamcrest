//
//  OCHamcrest - HCIsDictionaryContainingKey.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
     Matches dictionaries containing a key satisfying a given matcher.
    @ingroup collection
 */
@interface HCIsDictionaryContainingKey : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
}

+ (HCIsDictionaryContainingKey*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher;
- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher;

@end


/**
    Matches dictionaries containing a key satisfying a given matcher.
    @param matcherOrValue  A matcher, or a value for @ref equalTo matching.
    @see HCIsDictionaryContainingKey
    @ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasKey(id matcherOrValue);

/**
    Shorthand for @ref HC_hasKey, available if HC_SHORTHAND is defined.
    @ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasKey HC_hasKey
#endif
