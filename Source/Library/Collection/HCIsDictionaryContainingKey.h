//
//  OCHamcrest - HCIsDictionaryContainingKey.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsDictionaryContainingKey : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
}

+ (id)isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher;
- (id)initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher;

@end


OBJC_EXPORT id<HCMatcher> HC_hasKey(id keyMatch);

/**
    hasKey(keyMatch) -
    Matches if dictionary contains an entry whose key satisfies a given matcher.
    
    @param keyMatcher    The matcher to satisfy for the key, or an expected value for @ref equalTo matching.
    
    This matcher iterates the evaluated dictionary, searching for any key-value entry whose key
    satisfies the given matcher. @c hasKey is satisfied if a matching entry is found.
    
    Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
    equality.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasKey instead.)

    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define hasKey HC_hasKey
#endif
