//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches if examined object is contained within the nested collection.
 */
@interface HCIsIn : HCBaseMatcher

+ (instancetype)isInCollection:(id)collection;
- (instancetype)initWithCollection:(id)collection;

@end


FOUNDATION_EXPORT id HC_isIn(id aCollection);

#ifdef HC_SHORTHAND
/*!
 * @abstract isIn(aCollection) -
 * Creates a matcher that matches when the examined object is found within the specified collection.
 * @param aCollection The collection to search.
 * @discussion Invokes <code>-containsObject:</code> on <em>aCollection</em> to determine if the
 * examined object is an element of the collection.
 *
 * <b>Example</b><br />
 * <pre>assertThat(@"foo", isIn(@[@"bar", @"foo"]))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_isIn instead.
 */
#define isIn HC_isIn
#endif
