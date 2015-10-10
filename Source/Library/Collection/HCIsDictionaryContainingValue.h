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
 * Creates a matcher for NSDictionaries that matches when the examined dictionary contains at least
 * value that satisfies the specified matcher.
 * @param valueMatcher The matcher to satisfy for the value, or an expected value for <em>equalTo</em> matching.
 * @discussion This matcher works on any collection that has an <code>-allValues</code> method.
 *
 * Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check
 * for equality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(myDictionary, hasValue(equalTo(@"bar")))</pre>
 *
 * <pre>assertThat(myDictionary, hasValue(@"bar"))<pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasValue instead.
 */
#define hasValue HC_hasValue
#endif
