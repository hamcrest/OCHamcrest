//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches if dictionary contains entries that satisfy the list of keys and value
 * matchers.
 */
@interface HCIsDictionaryContainingEntries : HCDiagnosingMatcher

+ (instancetype)isDictionaryContainingKeys:(NSArray *)keys
                             valueMatchers:(NSArray *)valueMatchers;

- (instancetype)initWithKeys:(NSArray *)keys
               valueMatchers:(NSArray *)valueMatchers;

@end


FOUNDATION_EXPORT id HC_hasEntries(id keysAndValueMatch, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract hasEntries(firstKey, valueMatcher, ...) -
 * Creates a matcher for NSDictionaries that matches when the examined dictionary contains entries
 * satisfying a list of alternating keys and their value matchers.
 * @param firstKey A key (not a matcher) to look up.
 * @param valueMatcher,... The matcher to satisfy for the value, or an expected value
 * for <em>equalTo</em> matching.
 * @discussion Note that the keys must be actual keys, not matchers. Any value argument that is not
 * a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check for equality.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(personDict, hasEntries(@"firstName", equalTo(@"Jon"), @"lastName", equalTo(@"Reid"), nil))</pre>
 *
 * <pre>assertThat(personDict, hasEntries(@"firstName", @"Jon", @"lastName", @"Reid", nil))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasEntry instead.
 */
#define hasEntries HC_hasEntries
#endif
