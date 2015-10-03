//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches if any entry in a dictionary has a key satisfying the nested matcher.
 */
@interface HCIsDictionaryContainingKey : HCBaseMatcher

+ (instancetype)isDictionaryContainingKey:(id <HCMatcher>)keyMatcher;
- (instancetype)initWithKeyMatcher:(id <HCMatcher>)keyMatcher;

@end


FOUNDATION_EXPORT id HC_hasKey(id keyMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasKey(keyMatcher) -
 * Creates a matcher that matches when a dictionary contains an entry whose key satisfies the
 * specified matcher.
 * @param keyMatcher The matcher to satisfy for the key, or an expected value for @ref equalTo matching.
 * @discussion Creates a matcher for dictionaries matching when the examined dictionary contains at
 * least one key that satisfies the specified matcher.
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * Examples:
 * <ul>
 *   <li><code>assertThat(myDictionary, hasEntry(equalTo(\@"foo")))</code></li>
 *   <li><code>assertThat(myDictionary, hasEntry(\@"foo"))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasKey instead.
 */
#define hasKey HC_hasKey
#endif
