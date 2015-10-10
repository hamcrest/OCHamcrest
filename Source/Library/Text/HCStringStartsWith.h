//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCSubstringMatcher.h>


/*!
 * @abstract Tests string starts with a substring.
 */
@interface HCStringStartsWith : HCSubstringMatcher

+ (id)stringStartsWith:(NSString *)substring;

@end


FOUNDATION_EXPORT id HC_startsWith(NSString *prefix);

#ifdef HC_SHORTHAND
/*!
 * @abstract startsWith(prefix) -
 * Creates a matcher that matches when the examined object is a string that starts with the
 * specified string.
 * @param prefix The substring that the returned matcher will expect at the start of any examined
 * string. (Must not be <code>nil</code>.)
 * @discussion The matcher invokes <code>-hasPrefix:</code> on the examined object, passing the
 * specified <em>prefix</em>.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@"myStringOfNote", startsWith(@"my"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_startsWith instead.
 */
#define startsWith HC_startsWith
#endif
