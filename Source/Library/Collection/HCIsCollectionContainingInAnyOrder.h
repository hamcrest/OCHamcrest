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
 * Creates an order-agnostic matcher for collections that matches when each item in the examined
 * collection satisfies one matcher anywhere in the specified list of matchers.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass. For a positive match, the examined collection must be of the same
 * length as the specified list of matchers.
 *
 * Note: Each matcher in the specified list will only be used once during a given examination, so
 * be careful when specifying matchers that may be satisfied by more than one entry in an examined
 * collection.
 *
 * Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check
 * for equality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(@[@"foo", @"bar"], containsInAnyOrder(equalTo(@"bar"), equalTo(@"foo")))</pre>
 *
 * <pre>assertThat(@[@"foo", @"bar"], containsInAnyOrder(@"bar", @"foo"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_containsInAnyOrder instead.
 */
#define containsInAnyOrder HC_containsInAnyOrder
#endif
