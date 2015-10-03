//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCEvery.h>


/*!
 * @abstract Matches if every item in a collection satisfies any of the nested matchers.
 */
@interface HCIsCollectionOnlyContaining : HCEvery

+ (instancetype)isCollectionOnlyContaining:(id <HCMatcher>)matcher;

@end


FOUNDATION_EXPORT id HC_onlyContains(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract onlyContains(itemMatchers, ...) -
 * Creates a matcher that matches when each item of the examined collection satisfies any of the
 * specified matchers.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion Creates a matcher for collections (anything conforming to NSFastEnumeration) that
 * matches when a single pass yields a series of elements, each satisfying <b>any</b> of the
 * specified matchers. Any matcher may match multiple elements.
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"Jon", \@"John", \@"Bob"], onlyContains(startsWith(\@"Jo"), startsWith(\@("Bo"), nil))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_onlyContains instead.
 */
#define onlyContains HC_onlyContains
#endif
