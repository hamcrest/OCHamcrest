//
//  HCAssertThatAfter.h
//  OCHamcrest
//
//  Created by Sergio Padrino on 8/25/13.
//  Copyright (c) 2013 hamcrest.org. All rights reserved.
//

#import <objc/objc-api.h>

@protocol HCMatcher;

typedef id (^HCAssertThatAfterActualBlock)();

OBJC_EXPORT void HC_assertThatAfterWithLocation(id testCase, NSTimeInterval maxTime, HCAssertThatAfterActualBlock actualBlock, id<HCMatcher> matcher,
                                           const char *fileName, int lineNumber);

#define HC_assertThatAfter(maxTime, actualBlock, matcher)  \
    HC_assertThatAfterWithLocation(self, maxTime, actualBlock, matcher, __FILE__, __LINE__)

#define HC_futureValueOf(actual) ^{ return actual; }

/**
 assertThatAfter(maxTime, actualBlock, matcher) -
 Asserts that a value provided by a block will satisfy matcher in less than a given time.
 
 @param maxTime       Max time (in seconds) in which the matcher has to be satisfied.
 @param actualBlock   A block providing the object to evaluate until timeout or the matcher is satisfied.
 @param matcher       The matcher to satisfy as the expected condition.
 
 @c assertThatAfter checks several times if the matcher is satisfied before timeout. To evaluate the matcher, the actualBlock will
 provide updated values of actual. If the matcher is not satisfied after maxTime, an exception is thrown describing the mismatch.
 An easy way of defining this actualBlock is using the macro futureValueOf(actual), which also improves readability.
 
 In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_assertThatAfter and HC_futureValueOf instead.
 
 @ingroup integration
 */
#ifdef HC_SHORTHAND
#define assertThatAfter HC_assertThatAfter
#define futureValueOf HC_futureValueOf
#endif


