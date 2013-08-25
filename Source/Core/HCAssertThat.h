//
//  OCHamcrest - HCAssertThat.h
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <objc/objc-api.h>

@protocol HCMatcher;


OBJC_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char *fileName, int lineNumber);

#define HC_assertThat(actual, matcher)  \
    HC_assertThatWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    assertThat(actual, matcher) -
    Asserts that actual value satisfies matcher.
 
    @param actual   The object to evaluate as the actual value.
    @param matcher  The matcher to satisfy as the expected condition.
 
    @c assertThat passes the actual value to the matcher for evaluation. If the matcher is not
    satisfied, an exception is thrown describing the mismatch.
    
    @c assertThat is designed to integrate well with OCUnit and other unit testing frameworks.
    Unmet assertions are reported as test failures. In Xcode, these failures can be clicked to
    reveal the line of the assertion.
    
    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_assertThat instead.
    
    @ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThat HC_assertThat
#endif


OBJC_EXPORT void HC_willAssertThatWithLocation(id testCase, id (^actualBlock)(void), id<HCMatcher> matcher,
                                               const char *fileName, int lineNumber);

#define HC_willAssertThat(actual, matcher)  \
    HC_willAssertThatWithLocation(self, ^{ return (id)(actual); }, matcher, __FILE__, __LINE__)

/**
    willAssertThat(actual, matcher) -
    Asserts that the actual value satifies matcher now, or some time in the near future.

    @param actual   The object to evaluate as the actual value.
    @param matcher  The matcher to satisfy as the expected condition.

    @c willAssertThat works as @c assertThat, but it will also wait up to
    @c HC_willDefaultTimeout seconds for actual to satisfy the matcher. If after
    that time the matcher is still not satisfied the assertion will fail.

    Be aware that actual will be captured in a block and evaluated repeatedly until
    it satisfy the matcher or the timeout has occurred.

    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_willAssertThat instead.

    @ingroup integration
 */
#ifdef HC_SHORTHAND
    #define willAssertThat HC_willAssertThat
#endif

/**
    Retrieves the default timeout used by @c willAssertThat.

    The default value is 1 second.

    @ingroup integration
 */
OBJC_EXPORT NSTimeInterval HC_willDefaultTimeout(void);

/**
    Sets the default timeout used by @c willAssertThat.

    @ingroup integration
 */
OBJC_EXPORT void HC_setWillDefaultTimeout(NSTimeInterval defaultTimeout);
