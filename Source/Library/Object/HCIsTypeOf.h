//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCClassMatcher.h>


/*!
 * @abstract Matches objects that are of a given class.
 */
@interface HCIsTypeOf : HCClassMatcher

+ (id)isTypeOf:(Class)expectedClass;

@end


FOUNDATION_EXPORT id HC_isA(Class expectedClass);

#ifdef HC_SHORTHAND
/*!
 * @abstract isA(expectedClass) -
 * Creates a matcher that matches when the examined object is an instance of the specified class,
 * but not of any subclass.
 * @param expectedClass The class to compare against as the expected class.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(canoe, isA([Canoe class]))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isA instead.
 */
#define isA HC_isA
#endif
