// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCDiagnosingMatcher.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Matches if every item in a collection satisfies a nested matcher.
 */
@interface HCEvery : HCDiagnosingMatcher

@property (nonatomic, strong, readonly) id <HCMatcher> matcher;

- (instancetype)initWithMatcher:(id <HCMatcher>)matcher NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end


FOUNDATION_EXPORT id HC_everyItem(id <HCMatcher> itemMatcher);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract Creates a matcher for collections that matches when the examined collection's items are
 * all matched by the specified matcher.
 * @param itemMatcher The matcher to apply to every item provided by the examined collection.
 * @discussion This matcher works on any collection that conforms to the NSFastEnumeration protocol,
 * performing a single pass.
 *
 * <b>Example</b><br />
 * <pre>assertThat(\@[\@"bar", \@"baz"], everyItem(startsWith(\@"ba")))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_everyItem instead.
 */
static inline id everyItem(id <HCMatcher> itemMatcher)
{
    return HC_everyItem(itemMatcher);
}
#endif

NS_ASSUME_NONNULL_END
