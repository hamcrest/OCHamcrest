//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Calculates the logical negation of a matcher.
 */
@interface HCIsNot : HCBaseMatcher

+ (instancetype)isNot:(id <HCMatcher>)matcher;
- (instancetype)initNot:(id <HCMatcher>)matcher;

@end


FOUNDATION_EXPORT id HC_isNot(id matcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract isNot(matcher) -
 * Creates a matcher that wraps an existing matcher, but inverts the logic by which it will match.
 * @param matcher The matcher to negate.
 * @discussion If <em>matcher</em> is not a matcher, it is implicitly wrapped in an <em>equalTo</em>
 * matcher to check for equality, and thus matches for inequality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(cheese, isNot(equalTo(smelly)))</pre>
 *
 * <pre>assertThat(cheese, isNot(smelly))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isNot instead.
 */
#define isNot HC_isNot
#endif
