//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches if any entry in a dictionary has a value satisfying the nested matcher.
 */
@interface HCIsDictionaryContainingValue : HCBaseMatcher

+ (instancetype)isDictionaryContainingValue:(id <HCMatcher>)valueMatcher;
- (instancetype)initWithValueMatcher:(id <HCMatcher>)valueMatcher;

@end


FOUNDATION_EXPORT id HC_hasValue(id valueMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasValue(valueMatcher) -
 * Creates a matcher that matches when a dictionary contains an entry whose value satisfies the
 * specified matcher.
 * @param valueMatcher The matcher to satisfy for the value, or an expected value for @ref equalTo matching.
 * @discussion Creates a matcher for dictionaries matching when the examined dictionary contains at
 * least one value that satisfies the specified matcher.
 *
 * Any argument that is not a matcher is implicitly wrapped in an @ref equalTo matcher to check for
 * equality.
 *
 * Examples:
 * <ul>
 *   <li><code>assertThat(myDictionary, hasValue(equalTo(\@"bar")))</code></li>
 *   <li><code>assertThat(myDictionary, hasValue(\@"bar"))<code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasValue instead.
 */
#define hasValue HC_hasValue
#endif
