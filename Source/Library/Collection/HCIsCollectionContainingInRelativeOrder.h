//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if every item in a collection satisfies a list of nested matchers, in order.
 */
@interface HCIsCollectionContainingInRelativeOrder : HCDiagnosingMatcher
- (instancetype)initWithMatchers:(NSArray *)itemMatchers;
@end


FOUNDATION_EXPORT id hc_containsInRelativeOrder(NSArray *itemMatchers);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher that matches when the examined collection's elements satisfy the
 * specified list of matchers in relative order.
 * @param itemMatchers Array of matchers that must be satisfied by the items provided by the
 * examined collection in the same relative order.
 * @discussion Creates a matcher for collections that matches when a single pass over the examined
 * collection yields a series of items, that satisfy the corresponding matcher in the specified
 * matchers, in the same relative order.
 *
 * Any element of <em>itemMatchers</em> that is not a matcher is implicitly wrapped in
 * an @ref equalTo matcher to check for equality.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"a", \@"b", \@"b", \@"c", \@"d", \@"e", ], containsInRelativeOrder(equalTo(\@"b"), equalTo(\@"d")))</code></li>
 *   <li><code>assertThat(\@[\@"a", \@"b", \@"b", \@"c", \@"d", \@"e", ], containsInRelativeOrder(@"b", \@"d"))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * hc_containsInRelativeOrder instead.
 */
static inline id containsInRelativeOrder(NSArray *itemMatchers)
{
    return hc_containsInRelativeOrder(itemMatchers);
}
#endif
