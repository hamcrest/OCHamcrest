//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if every item in a collection satisfies a nested matcher.
 */
@interface HCEvery : HCDiagnosingMatcher

@property (nonatomic, strong, readonly) id <HCMatcher> matcher;

- (instancetype)initWithMatcher:(id <HCMatcher>)matcher;

@end


FOUNDATION_EXPORT id HC_everyItem(id itemMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract everyItem(itemMatcher) -
 * Creates a matcher for collections that matches when every item satisfies the specified matcher.
 * @param itemMatcher The matcher to apply to every item provided by the examined collection.
 * @discussion Creates a matcher for collections (anything conforming to NSFastEnumeration) that
 * iterates a single pass over the examined collection. It matches when all elements in the
 * collection are matched by the specified <em>itemMatcher</em>.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"bar", \@"baz"], everyItem(startsWith(\@"ba")))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym HC_everyItem instead.
 */
#define everyItem HC_everyItem
#endif
