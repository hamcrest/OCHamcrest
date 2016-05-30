//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import "MatcherTestCase.h"

#import <OCHamcrest/HCMatcher.h>
#import <OCHamcrest/HCStringDescription.h>


static NSString *mismatchDescription(id <HCMatcher> matcher, id arg)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [matcher describeMismatchOf:arg to:description];
    return description.description;
}


@implementation MatcherTestCase

- (void)failWithMessage:(NSString *)message
        inFile:(char const *)fileName atLine:(NSUInteger)lineNumber
{
    [self recordFailureWithDescription:message inFile:@(fileName) atLine:lineNumber expected:YES];
}

- (void)failEqualityBetweenObject:(id)left andObject:(id)right withMessage:(NSString *)message
        inFile:(char const *)fileName atLine:(NSUInteger)lineNumber
{
    [self recordFailureWithDescription:message inFile:@(fileName) atLine:lineNumber expected:YES];
}

- (void)assertMatcherSafeWithNil:(id <HCMatcher>)matcher
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    @try
    {
        [matcher matches:nil];
    }
    @catch (NSException *e)
    {
        [self failWithMessage:@"Matcher was not nil safe"
                       inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcherSafeWithUnknownType:(id <HCMatcher>)matcher
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    @try
    {
        [matcher matches:[[NSObject alloc] init]];
    }
    @catch (NSException *e)
    {
        [self failWithMessage:@"Matcher was not unknown type safe"
                       inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matches:(id)arg message:(NSString *)expectation
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    if (![matcher matches:arg])
    {
        NSString *message = [NSString stringWithFormat:@"%@ because '%@'",
                                                    expectation, mismatchDescription(matcher, arg)];
        [self failWithMessage:message inFile:fileName atLine:lineNumber];
    }
}

- (void)assertFalse:(BOOL)condition message:(NSString *)message
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    if (condition)
    {
        [self failWithMessage:message inFile:fileName atLine:lineNumber];
    }
}

- (void)assertString:(NSString *)str1 equalsString:(NSString *)str2 message:(NSString *)message
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    if (![str1 isEqualToString:str2])
    {
        [self failEqualityBetweenObject:str1 andObject:str2 withMessage:message
                                 inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher hasDescription:(NSString *)expected
               inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [description appendDescriptionOf:matcher];
    NSString *actual = description.description;
    NSString *message = [NSString stringWithFormat:@"Expected description '%@' but got '%@", expected, actual];
    [self assertString:expected equalsString:actual message:message
                inFile:fileName atLine:lineNumber];
}

- (void)assertMatcher:(id <HCMatcher>)matcher hasNoMismatchDescriptionFor:(id)arg
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    BOOL result = [matcher matches:arg];
    if (!result)
    {
        [self failWithMessage:@"Precondition: Matcher should match item"
                       inFile:fileName atLine:lineNumber];
    }
    if (description.description.length != 0)
    {
        [self failWithMessage:@"Expected no mismatch description"
                       inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg yieldsMismatchDescription:(NSString *)expected
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    // Make sure matcher has been called before, like assertThat would have done.
    [matcher matches:arg];
    BOOL result = [matcher matches:arg describingMismatchTo:description];
    if (result)
    {
        [self failWithMessage:@"Precondition: Matcher should not match item"
                       inFile:fileName atLine:lineNumber];
    }
    NSString *actual = description.description;
    if (![actual isEqualToString:expected])
    {
        [self failEqualityBetweenObject:actual andObject:expected
                            withMessage:@"Expected mismatch description"
                                 inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg
        yieldsMismatchDescriptionPrefix:(NSString *)expectedPrefix
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    // Make sure matcher has been called before, like assertThat would have done.
    [matcher matches:arg];
    BOOL result = [matcher matches:arg describingMismatchTo:description];
    if (result)
    {
        [self failWithMessage:@"Precondition: Matcher should not match item"
                       inFile:fileName atLine:lineNumber];
    }
    NSString *actual = description.description;
    if (![actual hasPrefix:expectedPrefix])
    {
        [self failEqualityBetweenObject:actual andObject:expectedPrefix
                            withMessage:@"Expected mismatch description prefix match"
                                 inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg describesMismatch:(NSString *)expected
        inFile:(const char *)fileName atLine:(NSUInteger)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [matcher describeMismatchOf:arg to:description];
    NSString *actual = description.description;
    if (![actual isEqualToString:expected])
    {
        [self failEqualityBetweenObject:actual andObject:expected
                            withMessage:@"Expected mismatch description"
                                 inFile:fileName atLine:lineNumber];
    }
}

@end
