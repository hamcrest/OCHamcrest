// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCBaseMatcher.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Provides a custom description to another matcher.
 */
@interface HCDescribedAs : HCBaseMatcher

- (instancetype)initWithDescription:(NSString *)description
                         forMatcher:(id <HCMatcher>)matcher
                         overValues:(NSArray *)templateValues NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end


FOUNDATION_EXPORT id HC_describedAs(NSString *description, id <HCMatcher> matcher, ...) NS_REQUIRES_NIL_TERMINATION;

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Wraps an existing matcher, overriding its description with that specified. All other
 * functions are delegated to the decorated matcher, including its mismatch description.
 * @param description The new description for the wrapped matcher.
 * @param matcher The matcher to wrap, followed by a comma-separated list of substitution
 * values ending with <code>nil</code>.
 * @discussion The description may contain substitution placeholders %0, %1, etc. These will be
 * replaced by any values that follow the matcher.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_describedAs instead.
 */
#define describedAs(description, matcher, ...) HC_describedAs(description, matcher, ##__VA_ARGS__)
#endif

NS_ASSUME_NONNULL_END
