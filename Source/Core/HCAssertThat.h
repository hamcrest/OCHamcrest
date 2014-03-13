//
//  OCHamcrest - HCAssertThat.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <Foundation/Foundation.h>

@protocol HCMatcher;


FOUNDATION_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id <HCMatcher> matcher,
                                                 const char *fileName, int lineNumber);

#define HC_buildExceptionCatcher(expression) \
    ^id() { \
        @try { \
            return expression; \
        } \
        @catch (NSException *__exception) { \
            return __exception; \
        } \
    }

#define HC_assertThat(expression, matcher)  \
    { \
        id (^exceptionCatcher)() = HC_buildExceptionCatcher(expression); \
        HC_assertThatWithLocation(self, exceptionCatcher(), matcher, __FILE__, __LINE__); \
    }

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
