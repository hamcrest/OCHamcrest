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
 * Creates a matcher for collections that matches when at least one item in the examined collection
 * satisfies the specified matcher.
 * @param itemMatcher The matcher to apply to collection elements, or an expected value
 * for <em>equalTo</em> matching.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass.
 *
 * If <em>itemMatcher</em> is not a matcher, it is implicitly wrapped in an <em>equalTo</em> matcher
 * to check for equality.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@[@1, @2, @3], hasItem(equalTo(@2)))</pre>
 *
 * <pre>assertThat(@[@1, @2, @3], hasItem(@2))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasItem instead.
 */
#define hasItem HC_hasItem
#endif


FOUNDATION_EXPORT id HC_hasItems(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract hasItems(itemMatchers, ...) -
 * Creates a matcher for collections that matches when all specified matchers are satisfied by any
 * item in the examined collection.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing one pass for each matcher.
 *
 * Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check
 * for equality.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@[@"foo", @"bar", @"baz"], hasItems(endsWith(@"z"), endsWith(@"o")))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasItems instead.
 */
#define hasItems HC_hasItems
#endif
