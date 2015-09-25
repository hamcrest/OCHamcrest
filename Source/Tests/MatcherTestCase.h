//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <XCTest/XCTest.h>

@protocol HCMatcher;


@interface MatcherTestCase : XCTestCase

- (void)assertMatcherSafeWithNil:(id <HCMatcher>)matcher
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcherSafeWithUnknownType:(id <HCMatcher>)matcher
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertTrue:(BOOL)condition message:(NSString *)message
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertFalse:(BOOL)condition message:(NSString *)message
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcher:(id <HCMatcher>)matcher hasTheDescription:(NSString *)expected
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcher:(id <HCMatcher>)matcher hasNoMismatchDescriptionFor:(id)arg
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg yieldsMismatchDescription:(NSString *)expected
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg
        yieldsMismatchDescriptionPrefix:(NSString *)expectedPrefix
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg describesMismatch:(NSString *)expected
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber;

@end

#define assertNilSafe(matcher)  \
    [self assertMatcherSafeWithNil:matcher inFile:__FILE__ atLine:__LINE__]

#define assertUnknownTypeSafe(matcher)  \
    [self assertMatcherSafeWithUnknownType:matcher inFile:__FILE__ atLine:__LINE__]

#define assertMatches(aMessage, matcher, arg)    \
    [self assertTrue:[matcher matches:arg] message:aMessage inFile:__FILE__ atLine:__LINE__]

#define assertDoesNotMatch(aMessage, matcher, arg)    \
    [self assertFalse:[matcher matches:arg] message:aMessage inFile:__FILE__ atLine:__LINE__]

#define assertDescription(expected, matcher)    \
    [self assertMatcher:matcher hasTheDescription:expected inFile:__FILE__ atLine:__LINE__]

#define assertNoMismatchDescription(matcher, arg)   \
    [self assertMatcher:matcher hasNoMismatchDescriptionFor:arg inFile:__FILE__ atLine:__LINE__]

#define assertMismatchDescription(expected, matcher, arg)   \
    [self assertMatcher:matcher matching:arg yieldsMismatchDescription:expected inFile:__FILE__ atLine:__LINE__]

#define assertMismatchDescriptionPrefix(expectedPrefix, matcher, arg)   \
    [self assertMatcher:matcher matching:arg yieldsMismatchDescriptionPrefix:expectedPrefix inFile:__FILE__ atLine:__LINE__]

#define assertDescribeMismatch(expected, matcher, arg)  \
    [self assertMatcher:matcher matching:arg describesMismatch:expected inFile:__FILE__ atLine:__LINE__]
