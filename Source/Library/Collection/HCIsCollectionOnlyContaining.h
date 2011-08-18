//
//  OCHamcrest - HCIsCollectionOnlyContaining.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsCollectionOnlyContaining : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (id)isCollectionOnlyContaining:(id<HCMatcher>)aMatcher;
- (id)initWithMatcher:(id<HCMatcher>)aMatcher;

@end


OBJC_EXPORT id<HCMatcher> HC_onlyContains(id itemMatch, ...);

/**
    Matches if each element of collection satisfies any of the given matchers.
    
    @param firstMatcher,...  A comma-separated list of matchers ending with @c nil.
    
    This matcher iterates the evaluated collection, confirming whether each element satisfies any of
    the given matchers.
    
    Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
    equality.
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_onlyContains instead.)

    @ingroup collection_matchers
 */
#ifdef HC_SHORTHAND
    #define onlyContains(firstMatcher, ...) HC_onlyContains(firstMatcher, ##__VA_ARGS__)
#endif
