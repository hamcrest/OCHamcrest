//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCClassMatcher.h>


/*!
 * @abstract Matches objects that are of a given class or any subclass.
 */
@interface HCIsInstanceOf : HCClassMatcher

+ (id)isInstanceOf:(Class)expectedClass;

@end


FOUNDATION_EXPORT id HC_instanceOf(Class expectedClass);

#ifdef HC_SHORTHAND
/*!
 * @abstract instanceOf(expectedClass) -
 * Creates a matcher that matches when the examined object is an instance of, or inherits from, the
 * specified class.
 * @param expectedClass The class to compare against as the expected class.
 * @discussion Creates a matcher that matches when the examined object is an instance of
 * <em>expectedClass</em> or an instance of any class that inherits from <em>expectedClass</em>.
 *
 * Example:
 * <ul>
 *   <li><code>assertThat(canoe, instanceOf([Canoe class]))</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_instanceOf instead.
 */
#define instanceOf HC_instanceOf
#endif
