//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCSubstringMatcher.h>


/*!
 * @abstract Tests if string that contains a substring.
 */
@interface HCStringContains : HCSubstringMatcher

+ (id)stringContains:(NSString *)substring;

@end


FOUNDATION_EXPORT id HC_containsString(NSString *aSubstring) __attribute__((deprecated));

#ifdef HC_SHORTHAND
/*!
 * @abstract containsString(aString) -
 * Creates a matcher that matches when the examined object is a string containing the specified
 * substring.
 * @param aString The string to search for. (Must not be <code>nil</code>.)
 * @discussion <em>Deprecated: Use @ref containsSubstring() instead.</em>
 *
 * This matcher first checks whether the examined object is a string. If so, it checks whether it
 * contains <em>aString</em>.
 *
 * Example:
 * <ul>
 *   <li><code>containsString(\@"def")</code></li>
 * </ul>
 * will match "abcdefg".
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_containsString instead.
 */
#define containsString HC_containsString
#endif


FOUNDATION_EXPORT id HC_containsSubstring(NSString *substring);

#ifdef HC_SHORTHAND
/*!
 * @abstract containsSubstring(substring) -
 * Creates a matcher that matches when the examined object is a string containing the specified
 * substring anywhere.
 * @param substring The string to search for. (Must not be <code>nil</code>.)
 * @discussion The matcher invokes <code>-rangeOfString:</code> on the examined object, passing the
 * specified <em>substring</em> and matching if it is found.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@"myStringOfNote", containsSubstring(@"ring"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_containsSubstring instead.
 */
#define containsSubstring HC_containsSubstring
#endif
