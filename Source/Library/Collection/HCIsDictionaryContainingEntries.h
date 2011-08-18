//
//  OCHamcrest - HCIsDictionaryContainingEntries.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsDictionaryContainingEntries : HCBaseMatcher
{
    NSArray *keys;
    NSArray *valueMatchers;
}

+ (id)isDictionaryContainingKeys:(NSArray *)theKeys
                   valueMatchers:(NSArray *)theValueMatchers;

- (id)initWithKeys:(NSArray *)theKeys
     valueMatchers:(NSArray *)theValueMatchers;

@end


OBJC_EXPORT id<HCMatcher> HC_hasEntries(id keysAndValueMatch, ...);

/**
    Matches if dictionary contains key-value entries satisfying a list of alternating keys and
    corresponding value matchers.
    
    @param firstKey  A key (not a matcher) to look up.
    @param valueMatcher,...  The matcher to satisfy for the value, or an expected value for @ref equalTo matching.
    
    Note that the keys must be actual keys, not matchers. Any value argument that is not a matcher
    is implicitly wrapped in an @ref equalTo matcher to check for equality. The list must end with
    @c nil.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasEntry instead.)

    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define hasEntries(firstKey, valueMatcher, ...)  HC_hasEntries(firstKey, valueMatcher, ##__VA_ARGS__)
#endif
