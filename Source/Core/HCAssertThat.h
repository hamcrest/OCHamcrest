//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>

@protocol HCMatcher;


FOUNDATION_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id <HCMatcher> matcher,
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

 @c assertThat is designed to integrate well with XCTest and other unit testing frameworks where
 tests are methods. Unmet assertions are reported as test failures.

 In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_assertThat instead.

 @ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThat HC_assertThat
#endif


#define HC_assertThatC(actual, matcher)  \
    HC_assertThatWithLocation(nil, actual, matcher, __FILE__, __LINE__)

/**
 assertThatC(actual, matcher) -
 Asserts that actual value satisfies matcher, in a standalone function.

 @param actual   The object to evaluate as the actual value.
 @param matcher  The matcher to satisfy as the expected condition.

 @c assertThatC passes the actual value to the matcher for evaluation. If the matcher is not
 satisfied, an exception is thrown describing the mismatch.

 @c assertThatC is designed for use in standalone C functions. It's designed to integrate well with
 unit testing frameworks where tests are standalone functions, not methods. You may also want to
 install a custom test failure handler for better reporting; see HCCedarTestFailureHandler as an
 example.

 In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_assertThatC instead.

 @ingroup integration
 */
#ifdef HC_SHORTHAND
#define assertThatC HC_assertThatC
#endif


typedef id (^HCAssertThatAfterActualBlock)() __attribute__((deprecated));

OBJC_EXPORT void HC_assertThatAfterWithLocation(id testCase, NSTimeInterval maxTime,
                                                HCAssertThatAfterActualBlock actualBlock,
                                                id<HCMatcher> matcher,
                                                const char *fileName, int lineNumber) __attribute__((deprecated));

#define HC_assertThatAfter(maxTime, actualBlock, matcher)  \
    HC_assertThatAfterWithLocation(self, maxTime, actualBlock, matcher, __FILE__, __LINE__)

#define HC_futureValueOf(actual) ^{ return actual; }

/**
 assertThatAfter(maxTime, actualBlock, matcher) -
 Asserts that a value provided by a block will satisfy matcher in less than a given time.

 @param maxTime     Max time (in seconds) in which the matcher has to be satisfied.
 @param actualBlock A block providing the object to evaluate until timeout or the matcher is satisfied.
 @param matcher     The matcher to satisfy as the expected condition.

 @b Deprecated: Use @ref assertWithTimeout instead.

 @c assertThatAfter checks several times if the matcher is satisfied before timeout. To evaluate the
 matcher, the @c actualBlock will provide updated values of actual. If the matcher is not satisfied
 after @c maxTime, an exception is thrown describing the mismatch. An easy way of defining this
 @c actualBlock is using the macro <code>futureValueOf(actual)</code>, which also improves
 readability.

 In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_assertThatAfter and HC_futureValueOf instead.

 @ingroup integration
*/
#ifdef HC_SHORTHAND
    #define assertThatAfter HC_assertThatAfter
    #define futureValueOf HC_futureValueOf
#endif


typedef id (^HCFutureValue)();

OBJC_EXPORT void HC_assertWithTimeoutAndLocation(id testCase, NSTimeInterval timeout,
        HCFutureValue actualBlock,
        id <HCMatcher> matcher,
        const char *fileName, int lineNumber);

#define HC_assertWithTimeout(timeout, actualBlock, matcher)  \
    HC_assertWithTimeoutAndLocation(self, timeout, actualBlock, matcher, __FILE__, __LINE__)

#define HC_thatEventually(actual) ^{ return actual; }

/**
 assertWithTimeout(timeout, actualBlock, matcher) -
 Asserts that a value provided by a block will satisfy matcher within a given time.

 @param timeout     Maximum time to wait for passing behavior, specified in seconds.
 @param actualBlock A block providing the object to repeatedly evaluate as the actual value.
 @param matcher     The matcher to satisfy as the expected condition.

 @c assertWithTimeout polls a value provided by a block to asynchronously satisfy the matcher. The
 block is evaluated repeatedly for an actual value, which is passed to the matcher for evaluation.
 If the matcher is not satisfied within the timeout, an exception is thrown describing the mismatch.

 An easy way of providing the @c actualBlock is to use the macro <code>thatEventually(actual)</code>.

 In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_assertWithTimeout and HC_thatEventually instead.

 @ingroup integration
*/
#ifdef HC_SHORTHAND
    #define assertWithTimeout HC_assertWithTimeout
    #define thatEventually HC_thatEventually
#endif
