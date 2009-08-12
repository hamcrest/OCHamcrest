//
//  OCHamcrest - HCHasDescription.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


@interface HCHasDescription : HCBaseMatcher
{
    id<HCMatcher> descriptionMatcher;
}

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)theDescriptionMatcher;
- (id) initWithDescription:(id<HCMatcher>)theDescriptionMatcher;

@end


#ifdef __cplusplus
extern "C" {
#endif

/**
    Evaluates whether [item description] satisfies a given matcher.

    Example: hasDescription(equalTo(result))
*/
id<HCMatcher> HC_hasDescription(id item);

#ifdef __cplusplus
}
#endif


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_hasDescription, available if HC_SHORTHAND is defined.
*/
#define hasDescription HC_hasDescription

#endif
