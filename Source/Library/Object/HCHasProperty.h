//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt
//  Contribution by Justin Shacklette

#import <OCHamcrest/HCDiagnosingMatcher.h>


/*!
 * @abstract Matches objects whose "property" (or simple method) satisfies a nested matcher.
 */
@interface HCHasProperty : HCDiagnosingMatcher

+ (instancetype)hasProperty:(NSString *)propertyName value:(id <HCMatcher>)valueMatcher;
- (instancetype)initWithProperty:(NSString *)propertyName value:(id <HCMatcher>)valueMatcher;

@end


FOUNDATION_EXPORT id HC_hasProperty(NSString *propertyName, id valueMatcher);

#ifdef HC_SHORTHAND
/*!
 * @abstract hasProperty(propertyName, valueMatcher) -
 * Creates a matcher that matches when the examined object has an instance method with the specified
 * name whose return value satisfies the specified matcher.
 * @param propertyName The name of an instance method without arguments that returns an object.
 * @param valueMatcher The matcher to satisfy for the return value, or an expected value for
 * <em>equalTo</em> matching.
 * @discussion Note: While this matcher factory is called "hasProperty", it applies to the return
 * values of any instance methods without arguments, not just properties.
 *
 * <b>Examples</b><br />
 * <pre>assertThat(person, hasProperty(@"firstName", equalTo(@"Joe")))</pre>
 *
 * <pre>assertThat(person, hasProperty(@"firstName", @"Joe"))</pre>
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_hasProperty instead.
 */
    #define hasProperty HC_hasProperty
#endif
