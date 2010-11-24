//
//  OCHamcrest - HCMatcherAssert.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <objc/objc-api.h>

@protocol HCMatcher;


OBJC_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that actual value satisfies matcher.
 */
#define HC_assertThat(actual, matcher)  \
    HC_assertThatWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for HC_assertThat, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
#define assertThat HC_assertThat
#endif
