//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Tests if a string is equal to another string, regardless of the case.
 */
@interface HCIsEqualIgnoringCase : HCBaseMatcher

+ (instancetype)isEqualIgnoringCase:(NSString *)string;
- (instancetype)initWithString:(NSString *)string;

@end


FOUNDATION_EXPORT id HC_equalToIgnoringCase(NSString *expectedString);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToIgnoringCase(expectedString) -
 * Creates a matcher for NSStrings that matches when the examined string is equal to the specified
 * expected string, ignoring case differences.
 * @param expectedString The expected value of matched strings. (Must not be <code>nil</code>.)
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(@"Foo", equalToIgnoringCase(@"FOO"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToIgnoringCase instead.
 */
#define equalToIgnoringCase HC_equalToIgnoringCase
#endif
