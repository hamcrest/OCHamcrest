//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCInvocationMatcher.h>


/*!
 * @abstract Matches objects whose description satisfies a nested matcher.
 */
@interface HCHasDescription : HCInvocationMatcher

+ (instancetype)hasDescription:(id <HCMatcher>)descriptionMatcher;
- (instancetype)initWithDescription:(id <HCMatcher>)descriptionMatcher;

@end


FOUNDATION_EXPORT id HC_hasDescription(id descriptionMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasDescription(descriptionMatcher) -
 * Creates a matcher that matches when the examined object's <code>-description</code> satisfies the
 * specified matcher.
 * @param descriptionMatcher The matcher used to verify the description result, or an expected value
 * for <em>equalTo</em> matching.
 * @discussion If <em>descriptionMatcher</em> is not a matcher, it is implicitly wrapped in
 * an <em>equalTo</em> matcher to check for equality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(myObject, hasDescription(equalTo(@"foo"))</pre>
 *
 * <pre>assertThat(myObject, hasDescription(@"foo"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasDescription instead.
 */
#define hasDescription HC_hasDescription
#endif
