// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>

#import <stdarg.h>

@protocol HCMatcher;


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Returns an array of values from a variable-length comma-separated list terminated
 * by <code>nil</code>.
 */
FOUNDATION_EXPORT NSArray * HCCollectItems(id item, va_list args);

/*!
 * @abstract Returns an array of matchers from a mixed array of items and matchers.
 * @discussion Each item is wrapped in HCWrapInMatcher to transform non-matcher items into equality
 * matchers.
 */
FOUNDATION_EXPORT NSArray<id <HCMatcher>> * HCWrapIntoMatchers(NSArray *items);

NS_ASSUME_NONNULL_END
