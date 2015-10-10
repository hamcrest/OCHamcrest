//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches anything.
 */
@interface HCIsAnything : HCBaseMatcher

+ (instancetype)isAnything;
+ (instancetype)isAnythingWithDescription:(NSString *)description;

- (instancetype)init;
- (instancetype)initWithDescription:(NSString *)description;

@end


FOUNDATION_EXPORT id HC_anything(void);

#ifdef HC_SHORTHAND
/*!
 * @abstract Creates a matcher that always matches, regardless of the examined object.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_anything instead.
 */
#define anything() HC_anything()
#endif


FOUNDATION_EXPORT id HC_anythingWithDescription(NSString *description);

#ifdef HC_SHORTHAND
/*!
 * @abstract anythingWithDescription(description) -
 * Creates a matcher that matches anything, regardless of the examined object, but describes itself
 * with the specified NSString.
 * @param description A meaningful string used to describe this matcher.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_anything instead.
 */
#define anythingWithDescription HC_anythingWithDescription
#endif
