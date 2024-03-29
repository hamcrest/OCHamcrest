// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCEvery.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Matches if every item in a collection satisfies any of the nested matchers.
 */
@interface HCIsCollectionOnlyContaining : HCEvery
@end

FOUNDATION_EXPORT id HC_onlyContainsIn(NSArray *itemMatchers);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher for collections that matches when each item of the examined
 * collection satisfies any of the specified matchers.
 * @param itemMatchers An array of matchers. Any element that is not a matcher is implicitly wrapped
 * in an <em>equalTo</em> matcher to check for equality.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass. Any matcher may match multiple elements.
 *
 * <b>Example</b><br />
 * <pre>assertThat(\@[\@"Jon", \@"John", \@"Bob"], onlyContainsIn(\@[startsWith(\@"Jo"), startsWith(\@("Bo")]))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_onlyContainsIn instead.
 */
static inline id onlyContainsIn(NSArray *itemMatchers)
{
    return HC_onlyContainsIn(itemMatchers);
}
#endif


FOUNDATION_EXPORT id HC_onlyContains(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher for collections that matches when each item of the examined
 * collection satisfies any of the specified matchers.
 * @param itemMatchers... A comma-separated list of matchers ending with <code>nil</code>.
 * Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check for
 * equality.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass. Any matcher may match multiple elements.
 *
 * <b>Example</b><br />
 * <pre>assertThat(\@[\@"Jon", \@"John", \@"Bob"], onlyContains(startsWith(\@"Jo"), startsWith(\@("Bo"), nil))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_onlyContains instead.
 */
#define onlyContains(itemMatchers...) HC_onlyContains(itemMatchers)
#endif

NS_ASSUME_NONNULL_END
