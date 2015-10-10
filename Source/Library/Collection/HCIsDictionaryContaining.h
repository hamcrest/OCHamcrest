//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches if any entry in a dictionary satisfies the nested pair of matchers.
 */
@interface HCIsDictionaryContaining : HCBaseMatcher

+ (instancetype)isDictionaryContainingKey:(id <HCMatcher>)keyMatcher
                                    value:(id <HCMatcher>)valueMatcher;

- (instancetype)initWithKeyMatcher:(id <HCMatcher>)keyMatcher
                      valueMatcher:(id <HCMatcher>)valueMatcher;

@end


FOUNDATION_EXPORT id HC_hasEntry(id keyMatcher, id valueMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasEntry(keyMatcher, valueMatcher) -
 * Creates a matcher for NSDictionaries that matches when the examined dictionary contains at least
 * one entry whose key satisfies the specified <code>keyMatcher</code> <b>and</b> whose value
 * satisfies the specified <code>valueMatcher</code>.
 * @param keyMatcher The matcher to satisfy for the key, or an expected value for <em>equalTo</em> matching.
 * @param valueMatcher The matcher to satisfy for the value, or an expected value for <em>equalTo</em> matching.
 * @discussion Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em>
 * matcher to check for equality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(myDictionary, hasEntry(equalTo(@"foo"), equalTo(@"bar")))</pre>
 *
 * <pre>assertThat(myDictionary, hasEntry(@"foo", @"bar"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasEntry instead.
 */
#define hasEntry HC_hasEntry
#endif
