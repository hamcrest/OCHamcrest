//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Tests if a string is equal to another string, ignoring any changes in whitespace.
 */
@interface HCIsEqualIgnoringWhiteSpace : HCBaseMatcher

+ (instancetype)isEqualIgnoringWhiteSpace:(NSString *)string;
- (instancetype)initWithString:(NSString *)string;

@end


FOUNDATION_EXPORT id HC_equalToIgnoringWhiteSpace(NSString *expectedString);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToIgnoringWhiteSpace(expectedString) -
 * Creates a matcher for NSStrings that matches when the examined string is equal to the specified
 * expected string, ignoring differences in whitespace.
 * @param expectedString The expected value of matched strings. (Must not be <code>nil</code>.)
 * @discussion To be exact, the following whitespace rules are applied:
 * <ul>
 *   <li>all leading and trailing whitespace of both the <em>expectedString</em> and the examined string are ignored</li>
 *   <li>any remaining whitespace, appearing within either string, is collapsed to a single space before comparison</li>
 * </ul>
 *
 * <b>Example</b><br />
 * <pre>assertThat(@"   my\tfoo  bar ", equalToIgnoringWhiteSpace(@" my  foo bar"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToIgnoringWhiteSpace instead.
 */
#define equalToIgnoringWhiteSpace HC_equalToIgnoringWhiteSpace
#endif
