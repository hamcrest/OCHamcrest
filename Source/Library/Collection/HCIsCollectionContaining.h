//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if any item in a collection satisfies a nested matcher.
 */
@interface HCIsCollectionContaining : HCDiagnosingMatcher

+ (instancetype)isCollectionContaining:(id <HCMatcher>)elementMatcher;
- (instancetype)initWithMatcher:(id <HCMatcher>)elementMatcher;

@end


FOUNDATION_EXPORT id HC_hasItem(id itemMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasItem(itemMatcher) -
 * Creates a matcher for collections that matches when any item satisfies the specified matcher.
 * @param itemMatcher The matcher to apply to collection elements, or an expected value
 * for @ref equalTo matching.
 * @discussion Creates a matcher for collections (anything conforming to NSFastEnumeration) that
 * iterates a single pass over the examined collection. It matches when at least one item in the
 * collection is matched by the specified <em>itemMatcher</em>.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"foo", \@"bar"], hasItem(startsWith(\@"ba")))</code></li>
 * </ul>
 *
 * If <em>itemMatcher</em> is not a matcher, it is implicitly wrapped in an @ref equalTo matcher to
 * check for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasItem instead.
 */
#define hasItem HC_hasItem
#endif


FOUNDATION_EXPORT id HC_hasItems(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract hasItems(itemMatchers, ...) -
 * Creates a matcher for collections that matches when all specified matchers are satisfied by any item.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion Creates a matcher for collections (anything conforming to NSFastEnumeration) that
 * iterates consecutive passes over the examined collection. It matches when each pass over the
 * collection yields at least one item that is matched by the corresponding matcher from the
 * specified list of matchers.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"foo", \@"bar", \@"baz"], hasItems(endsWith(\@"z"), endsWith(\@"o")))</code></li>
 * </ul>
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasItems instead.
 */
#define hasItems HC_hasItems
#endif
