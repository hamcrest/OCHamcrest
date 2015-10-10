//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCHasCount.h>


/*!
 * @abstract Matches empty collections.
 */
@interface HCIsEmptyCollection : HCHasCount

+ (instancetype)isEmptyCollection;
- (instancetype)init;

@end


FOUNDATION_EXPORT id HC_isEmpty(void);

#ifdef HC_SHORTHAND
/*!
 * @abstract Creates a matcher that matches any examined object whose <code>-count</code> method
 * returns an NSNumber of zero.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@[], isEmpty())</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isEmpty instead.
 */
#define isEmpty() HC_isEmpty()
#endif
