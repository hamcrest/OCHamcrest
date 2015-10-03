//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if every item in a collection satisfies a list of nested matchers, in order.
 */
@interface HCIsCollectionContainingInOrder : HCDiagnosingMatcher

+ (instancetype)isCollectionContainingInOrder:(NSArray *)itemMatchers;
- (instancetype)initWithMatchers:(NSArray *)itemMatchers;

@end


FOUNDATION_EXPORT id HC_contains(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract contains(itemMatchers, ...) -
 * Creates a matcher that matches when the examined collection's elements satisfy the specified list
 * of matchers, in order.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion Creates a matcher for collections that matches when a single pass over the examined
 * collection yields a series of items, each satisfying the corresponding matcher in the specified
 * matchers. For a positive match, the examined collection must be of the same length as the number
 * of specified matchers.
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(\@[\@"foo", \@"bar"], contains(equalTo(\@"foo"), equalTo(\@"bar")))</code></li>
 *   <li><code>assertThat(\@[\@"foo", \@"bar"], contains(\@"foo", \@"bar"))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_contains instead.)
 */
    #define contains HC_contains
#endif
