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
 * for @ref equalTo matching.
 * @discussion Creates a matcher that matches any examined object whose <code>-description</code>
 * method returns a value that satisfies the specified matcher.
 *
 * If <em>descriptionMatcher</em> is not a matcher, it is implicitly wrapped in an @ref equalTo matcher to
 * check for equality.
 *
 * Examples:
 * <ul>
 *   <li><code>hasDescription(startsWith(\@"foo"))</code></li>
 *   <li><code>hasDescription(\@"bar")</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasDescription instead.
 */
#define hasDescription HC_hasDescription
#endif
