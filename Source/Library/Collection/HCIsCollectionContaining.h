//
//  OCHamcrest - HCIsCollectionContaining.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsCollectionContaining : HCBaseMatcher
{
    id<HCMatcher> elementMatcher;
}

+ (id)isCollectionContaining:(id<HCMatcher>)anElementMatcher;
- (id)initWithMatcher:(id<HCMatcher>)anElementMatcher;

@end


OBJC_EXPORT id<HCMatcher> HC_hasItem(id itemMatch);

/**
    Matches if any element of collection satisfies a given matcher.
    
    @param aMatcher  The matcher to satisfy, or an expected value for @ref equalTo matching.
    
    This matcher iterates the evaluated collection, searching for any element that satisfies a
    given matcher. @c hasItem is satisfied if a matching element is found.
    
    If the @a aMatcher argument is not a matcher, it is implicitly wrapped in an @ref equalTo
    matcher to check for equality.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasItem instead.)

    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define hasItem(aMatcher) HC_hasItem(aMatcher)
#endif


OBJC_EXPORT id<HCMatcher> HC_hasItems(id itemMatch, ...);

/**
    Matches if any element of collection satisfies all of the given matchers.
    
    @param firstMatcher,...  A comma-separated list of matchers ending with @c nil.
    
    This matcher iterates the evaluated collection, searching for any element that satisfies all of
    the given matchers. @c hasItems is satisfied if a matching element is found.
    
    Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
    equality.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c hasItems instead.)

    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define hasItems(firstMatcher, ...) HC_hasItems(firstMatcher, ##__VA_ARGS__)
#endif
