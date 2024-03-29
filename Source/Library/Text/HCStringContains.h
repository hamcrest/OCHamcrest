// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCSubstringMatcher.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Tests if string that contains a substring.
 */
@interface HCStringContains : HCSubstringMatcher
@end


FOUNDATION_EXPORT id HC_containsSubstring(NSString *substring);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher that matches when the examined object is a string containing the
 * specified substring anywhere.
 * @param substring The string to search for. (Must not be <code>nil</code>.)
 * @discussion The matcher invokes <code>-rangeOfString:</code> on the examined object, passing the
 * specified <em>substring</em> and matching if it is found.
 *
 * <b>Example</b><br />
 * <pre>assertThat(\@"myStringOfNote", containsSubstring(\@"ring"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_containsSubstring instead.
 */
static inline id containsSubstring(NSString *substring)
{
    return HC_containsSubstring(substring);
}
#endif

NS_ASSUME_NONNULL_END
