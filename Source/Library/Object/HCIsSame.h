//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Is the value the same object as another value?
 */
@interface HCIsSame : HCBaseMatcher

+ (instancetype)isSameAs:(id)object;
- (instancetype)initSameAs:(id)object;

@end


FOUNDATION_EXPORT id HC_sameInstance(id expectedInstance);

#ifdef HC_SHORTHAND
/*!
 * @abstract sameInstance(expectedInstance) -
 * Creates a matcher that matches only when the examined object is the same instance as the
 * specified target object.
 * @param expectedInstance The expected instance.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(delegate, sameInstance(expectedDelegate))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_sameInstance instead.
 */
#define sameInstance HC_sameInstance
#endif
