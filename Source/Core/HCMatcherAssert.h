//
//  OCHamcrest - HCMatcherAssert.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <objc/objc-api.h>

@protocol HCMatcher;


/**
    Specify whether @ref assertThat should describe mismatches in the old, deprecated way.
 
    Prior to OCHamcrest 1.2, @ref assertThat reported mismatches by simply stating the actual value.
    This was incorrect, and the new implementation asks the matcher to describe the mismatch. This
    gives more detailed descriptions.
 
    If you have unit tests for your own custom matchers that test the message given by
    @ref assertThat, they will now fail. As a short-term fix, call
    @c HCUseDeprecatedDescription(YES) to change mismatch descriptions to their old output. For a
    more complete fix, update your tests match the new description format.
 */
OBJC_EXPORT void HCUseDeprecatedDescription(BOOL useDeprecated);


OBJC_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that actual value satisfies matcher.
 
    @b Synonym: @ref assertThat
    @ingroup integration
 */
#define HC_assertThat(actual, matcher)  \
    HC_assertThatWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Synonym for @ref HC_assertThat, available if @c HC_SHORTHAND is defined.
    @ingroup integration
 */
#ifdef HC_SHORTHAND
#define assertThat HC_assertThat
#endif
