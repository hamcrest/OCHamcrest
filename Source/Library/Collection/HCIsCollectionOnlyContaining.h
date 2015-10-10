//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCEvery.h>


/*!
 * @abstract Matches if every item in a collection satisfies any of the nested matchers.
 */
@interface HCIsCollectionOnlyContaining : HCEvery

+ (instancetype)isCollectionOnlyContaining:(id <HCMatcher>)matcher;

@end


FOUNDATION_EXPORT id HC_onlyContains(id itemMatchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifdef HC_SHORTHAND
/*!
 * @abstract onlyContains(itemMatchers, ...) -
 * Creates a matcher for collections that matches when each item of the examined collection
 * satisfies any of the specified matchers.
 * @param itemMatchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass. Any matcher may match multiple elements.
 *
 * Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em> matcher to check for
 * equality.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@[@"Jon", @"John", @"Bob"], onlyContains(startsWith(@"Jo"), startsWith(@("Bo"), nil))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_onlyContains instead.
 */
#define onlyContains HC_onlyContains
#endif
