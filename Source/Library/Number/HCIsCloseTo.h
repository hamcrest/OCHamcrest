//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matchers numbers close to a value, within a delta range.
 */
@interface HCIsCloseTo : HCBaseMatcher

+ (instancetype)isCloseTo:(double)value within:(double)delta;
- (instancetype)initWithValue:(double)value delta:(double)delta;

@end


FOUNDATION_EXPORT id HC_closeTo(double value, double delta);

#ifdef HC_SHORTHAND
/*!
 * @abstract closeTo(value, delta) -
 * Creates a matcher for NSNumbers that matches when the examined number is close to the specified
 * value, within the specified delta.
 * @param value The expected value of matching numbers.
 * @param delta The delta within which matches will be allowed.
 * @discussion Invokes <code>-doubleValue</code> on the examined number to get its value.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@1.03, closeTo(1.0, 0.03)</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_closeTo instead.
 */
#define closeTo HC_closeTo
#endif
