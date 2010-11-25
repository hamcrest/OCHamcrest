//
//  OCHamcrest - HCIsDictionaryContaining.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches dictionaries containing a key-value pair satisfying a pair of matchers.
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
 
    \a key is a matcher, or an implied HCIsEqual matcher will wrap the key.
    \a value is a matcher, or an implied HCIsEqual matcher will wrap the key.
 */
OBJC_EXPORT id<HCMatcher> HC_hasEntry(id key, id value);

/**
    Shorthand for \ref HC_hasEntry, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define hasEntry HC_hasEntry
#endif
