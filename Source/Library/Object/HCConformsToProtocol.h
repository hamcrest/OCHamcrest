//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt
//  Contribution by Todd Farrell

#import <OCHamcrest/HCBaseMatcher.h>


/*!
 * @abstract Matches objects that conform to specified protocol.
 */
@interface HCConformsToProtocol : HCBaseMatcher

+ (instancetype)conformsTo:(Protocol *)protocol;
- (instancetype)initWithProtocol:(Protocol *)protocol;

@end


FOUNDATION_EXPORT id HC_conformsTo(Protocol *aProtocol);

#ifdef HC_SHORTHAND
/*!
 * @abstract conformsTo(aProtocol) -
 * Creates a matcher that matches when the examined object conforms to the specified protocol.
 * @param aProtocol The protocol to compare against as the expected protocol.
 * @discussion
 * <b>Example</b><br />
 * <pre>assertThat(myObject, conformsTo(@protocol(NSCoding))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_conformsTo instead.
 */
#define conformsTo HC_conformsTo
#endif
