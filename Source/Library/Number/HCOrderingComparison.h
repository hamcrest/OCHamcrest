//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches values with <code>-compare:</code>.
 */
@interface HCOrderingComparison : HCBaseMatcher

+ (instancetype)compare:(id)expectedValue
             minCompare:(NSComparisonResult)min
             maxCompare:(NSComparisonResult)max
  comparisonDescription:(NSString *)comparisonDescription;

- (instancetype)initComparing:(id)expectedValue
                   minCompare:(NSComparisonResult)min
                   maxCompare:(NSComparisonResult)max
        comparisonDescription:(NSString *)comparisonDescription;

@end


FOUNDATION_EXPORT id HC_greaterThan(id value);

#ifdef HC_SHORTHAND
/*!
 * @abstract greaterThan(value) -
 * Creates a matcher that matches when the examined object is greater than the specified value, as
 * reported by the <code>-compare:</code> method of the <b>examined</b> object.
 * @param value The value which, when passed to the <code>-compare:</code> method of the examined
 * object, should return NSOrderedAscending.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(@2, greaterThan(@1))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_greaterThan instead.
 */
#define greaterThan HC_greaterThan
#endif


FOUNDATION_EXPORT id HC_greaterThanOrEqualTo(id value);

#ifdef HC_SHORTHAND
/*!
 * @abstract greaterThanOrEqualTo(value) -
 * Creates a matcher that matches when the examined object is greater than or equal to the specified
 * value, as reported by the <code>-compare:</code> method of the <b>examined</b> object.
 * @param value The value which, when passed to the <code>-compare:</code> method of the examined
 * object, should return NSOrderedAscending or NSOrderedSame.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(@1, greaterThan(@1))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_greaterThanOrEqualTo instead.
 */
#define greaterThanOrEqualTo HC_greaterThanOrEqualTo
#endif


FOUNDATION_EXPORT id HC_lessThan(id value);

#ifdef HC_SHORTHAND
/*!
 * @abstract lessThan(value) -
 * Creates a matcher that matches when the examined object is less than the specified value, as
 * reported by the <code>-compare:</code> method of the <b>examined</b> object.
 * @param value The value which, when passed to the <code>-compare:</code> method of the examined
 * object, should return NSOrderedDescending.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(@1, lessThan(@2))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_lessThan instead.
 */
#define lessThan HC_lessThan
#endif


FOUNDATION_EXPORT id HC_lessThanOrEqualTo(id value);

#ifdef HC_SHORTHAND
/*!
 * @abstract lessThanOrEqualTo(value) -
 * Creates a matcher that matches when the examined object is less than or equal to the specified
 * value, as reported by the <code>-compare:</code> method of the <b>examined</b> object.
 * @param value The value which, when passed to the <code>-compare:</code> method of the examined
 * object, should return NSOrderedDescending or NSOrderedSame.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(@1, lessThanOrEqualTo(@1))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_lessThanOrEqualTo instead.
 */
#define lessThanOrEqualTo HC_lessThanOrEqualTo
#endif
