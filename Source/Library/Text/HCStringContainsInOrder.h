//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Tests if string that contains a list of substrings in relative order.
 */
@interface HCStringContainsInOrder : HCBaseMatcher

+ (instancetype)containsInOrder:(NSArray *)substrings;
- (instancetype)initWithSubstrings:(NSArray *)substrings;

@end


FOUNDATION_EXPORT id HC_stringContainsInOrder(NSString *substrings, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract stringContainsInOrder(substrings, ...) -
 * Creates matcher that matches when the examined object is a string containing a given list of
 * substrings in relative order.
 * @param substrings,... A comma-separated list of strings that must be contained within matching
 * strings, ending with <code>nil</code>.
 * @discussion Creates a matcher for NSStrings that matches when the examined string contains all of
 * the specified substrings, considering the order of their appearance.
 *
 * For example:
 * <ul>
 *   <li><code>assertThat(@"myfoobarbaz", stringContainsInOrder(\@"bar", \@"foo", nil))</code></li>
 * </ul>
 * fails as "foo" occurs before "bar" in the string "myfoobarbaz"
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_stringContainsInOrder instead.
 */
#define stringContainsInOrder HC_stringContainsInOrder
#endif
