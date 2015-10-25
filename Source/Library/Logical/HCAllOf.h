//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Calculates the logical conjunction of multiple matchers.
 * @discussion Evaluation is shortcut, so subsequent matchers are not called if an earlier matcher
 * returns <code>NO</code>.
 */
@interface HCAllOf : HCDiagnosingMatcher

- (instancetype)initWithMatchers:(NSArray *)matchers;

@end


FOUNDATION_EXPORT id HC_allOf(id matchers, ...) NS_REQUIRES_NIL_TERMINATION;

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract allOf(matchers, ...) -
 * Creates a matcher that matches when the examined object matches <b>all</b> of the specified matchers.
 * @param matchers,... A comma-separated list of matchers ending with <code>nil</code>.
 * @discussion Any argument that is not a matcher is implicitly wrapped in an <em>equalTo</em>
 * matcher to check for equality.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@"myValue", allOf(startsWith(@"my"), containsSubstring(@"Val"), nil))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_allOf instead.
 */
#define allOf HC_allOf
#endif
