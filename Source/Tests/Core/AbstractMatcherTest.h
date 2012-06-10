//
//  OCHamcrest - AbstractMatcherTest.h
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <SenTestingKit/SenTestingKit.h>

@protocol HCMatcher;


@interface AbstractMatcherTest : SenTestCase

- (void)assertTrue:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber;
- (void)assertFalse:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber;
- (void)assertMatcher:(id<HCMatcher>)matcher hasTheDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber;
- (void)assertMatcher:(id<HCMatcher>)matcher hasNoMismatchDescriptionFor:(id)arg
                inFile:(const char *)fileName atLine:(int)lineNumber;
- (void)assertMatcher:(id<HCMatcher>)matcher matching:(id)arg yieldsMismatchDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber;
- (void)assertMatcher:(id<HCMatcher>)matcher matching:(id)arg describesMismatch:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber;

- (id<HCMatcher>)createMatcher;

@end


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

#define assertDescribeMismatch(expected, matcher, arg)  \
    [self assertMatcher:matcher matching:arg describesMismatch:expected inFile:__FILE__ atLine:__LINE__]
