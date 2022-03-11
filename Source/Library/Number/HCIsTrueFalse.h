// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCBaseMatcher.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Matches true values.
 */
@interface HCIsTrue : HCBaseMatcher
@end

/*!
 * @abstract Matches false values.
 */
@interface HCIsFalse : HCBaseMatcher
@end


FOUNDATION_EXPORT id HC_isTrue(void);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher that matches when the examined object is an non-zero NSNumber.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_isTrue instead.
 */
static inline id isTrue(void)
{
    return HC_isTrue();
}
#endif


FOUNDATION_EXPORT id HC_isFalse(void);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher that matches when the examined object is NSNumber zero.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_isFalse instead.
*/
static inline id isFalse(void)
{
    return HC_isFalse();
}
#endif

NS_ASSUME_NONNULL_END
