//
//  OCHamcrest - HCIsDictionaryContaining.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches dictionaries containing a key-value pair satisfying a pair of matchers.
    \ingroup collection
 */
@interface HCIsDictionaryContaining : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
    id<HCMatcher> valueMatcher;
}

+ (HCIsDictionaryContaining*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher
                                                  value:(id<HCMatcher>)theValueMatcher;
- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher
             valueMatcher:(id<HCMatcher>)theValueMatcher;

@end


/**
    Matches dictionaries containing a key-value pair satisfying a pair of matchers.
    \param keyMatcherOrValue    A matcher for the key, or an implied HCIsEqual matcher wrapping a value.
    \param valueMatcherOrValue  A matcher for the value, or an implied HCIsEqual matcher wrapping a value.
    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasEntry(id keyMatcherOrValue, id valueMatcherOrValue);

/**
    Shorthand for \ref HC_hasEntry, available if HC_SHORTHAND is defined.
    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasEntry HC_hasEntry
#endif
