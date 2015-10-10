//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches true values.
 */
@interface HCIsTrue : HCBaseMatcher
@end

/*!
 * @abstract Matches false values.
 */
@interface HCIsFalse : HCBaseMatcher
@end


FOUNDATION_EXPORT id HC_isTrue(void);

#ifdef HC_SHORTHAND
/*!
 * @abstract Creates a matcher that matches when the examined object is an non-zero NSNumber.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isTrue instead.
 */
#define isTrue() HC_isTrue()
#endif


FOUNDATION_EXPORT id HC_isFalse(void);

#ifdef HC_SHORTHAND
/*!
 * @abstract Creates a matcher that matches when the examined object is NSNumber zero.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isFalse instead.
*/
#define isFalse() HC_isFalse()
#endif
