// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>

@protocol HCMatcher;


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Wraps argument in a matcher, if necessary.
 * @return The argument as-is if it is already a matcher, otherwise wrapped in an <em>equalTo</em> matcher.
 */
FOUNDATION_EXPORT _Nullable id <HCMatcher> HCWrapInMatcher(_Nullable id matcherOrValue);

NS_ASSUME_NONNULL_END
