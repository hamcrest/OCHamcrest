//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if every item in a collection, in any order, satisfy a list of nested matchers.
 */
@interface HCIsCollectionContainingInAnyOrder : HCDiagnosingMatcher

+ (instancetype)isCollectionContainingInAnyOrder:(NSArray *)itemMatchers;
- (instancetype)initWithMatchers:(NSArray *)itemMatchers;

@end


FOUNDATION_EXPORT id HC_containsInAnyOrder(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract containsInAnyOrder(itemMatchers, ...) -
 * Creates a matcher that matches when the examined collection's elements, in any order, satisfy the
 * specified list of matchers.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion Creates an order-agnostic matcher for collections (anything conforming to
 * NSFastEnumeration) that matches matches when a single pass over the examined collection yields a
 * series of elements, each satisfying the specified one matcher anywhere in the specified list of
 * matchers. For a positive matcher, the examined collection must be of the same length as the
 * specified list of matchers.
 *
 * Note: Each matcher in the specified list will only be used once during a given examination, so
 * be careful when specifying matchers that may be satisfied by more than one entry in an examined
 * collection.
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"foo", \@"bar"], containsInAnyOrder(equalTo(\@"bar"), equalTo(\@"foo")))</code></li>
 *   <li><code>assertThat(\@[\@"foo", \@"bar"], containsInAnyOrder(\@"bar", \@"foo"))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_containsInAnyOrder instead.
 */
#define containsInAnyOrder HC_containsInAnyOrder
#endif
