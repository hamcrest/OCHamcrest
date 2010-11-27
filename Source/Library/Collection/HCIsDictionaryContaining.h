//
//  OCHamcrest - HCIsDictionaryContaining.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches dictionaries containing a key-value pair satisfying a given pair of matchers.
    \ingroup collection
 */
@interface HCIsDictionaryContaining : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
    id<HCMatcher> valueMatcher;
}

+ (HCIsDictionaryContaining*) isDictionaryContainingKey:(id<HCMatcher>)aKeyMatcher
                                                  value:(id<HCMatcher>)aValueMatcher;
- (id) initWithKeyMatcher:(id<HCMatcher>)aKeyMatcher
             valueMatcher:(id<HCMatcher>)aValueMatcher;

@end


/**
    Matches dictionaries containing a key-value pair satisfying a given pair of matchers.
    \param keyMatcher    A matcher - or a value for \ref equalTo matching - for the key.
    \param valueMatcher  A matcher - or a value for \ref equalTo matching - for the value.
    \see HCIsDictionaryContaining
    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasEntry(id keyMatcher, id valueMatcher);

/**
    Shorthand for \ref HC_hasEntry, available if HC_SHORTHAND is defined.
    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasEntry HC_hasEntry
#endif
