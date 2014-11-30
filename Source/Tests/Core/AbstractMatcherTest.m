//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

#import "AbstractMatcherTest.h"

#import <OCHamcrest/HCMatcher.h>
#import <OCHamcrest/HCStringDescription.h>


@implementation AbstractMatcherTest

- (void)failWithMessage:(NSString *)message inFile:(char const *)fileName atLine:(int)lineNumber
{
    [self failWithException:[NSException failureInFile:@(fileName)
                                                atLine:lineNumber
                                       withDescription:message]];
}

- (void)failEqualityBetweenObject:(id)left andObject:(id)right withMessage:(NSString *)message
                inFile:(char const *)fileName atLine:(int)lineNumber
{
    [self failWithException:
            [NSException failureInEqualityBetweenObject:left
                                              andObject:right
                                                 inFile:@(fileName)
                                                 atLine:lineNumber
                                        withDescription:message]];

}

- (void)assertMatcherSafeWithNil:(id <HCMatcher>)matcher
                inFile:(const char *)fileName atLine:(int)lineNumber
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
                inFile:(const char *)fileName atLine:(int)lineNumber
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

- (void)assertTrue:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    if (!condition)
    {
        [self failWithMessage:message inFile:fileName atLine:lineNumber];
    }
}

- (void)assertFalse:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    if (condition)
    {
        [self failWithMessage:message inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher hasTheDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [description appendDescriptionOf:matcher];
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failEqualityBetweenObject:actual andObject:expected
                            withMessage:@"Expected description"
                                 inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher hasNoMismatchDescriptionFor:(id)arg
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    BOOL result = [matcher matches:arg];
    if (!result)
    {
        [self failWithMessage:@"Precondition: Matcher should match item"
                       inFile:fileName atLine:lineNumber];
    }
    if ([[description description] length] != 0)
    {
        [self failWithMessage:@"Expected no mismatch description"
                       inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg yieldsMismatchDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
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
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failEqualityBetweenObject:actual andObject:expected
                            withMessage:@"Expected mismatch description"
                                 inFile:fileName atLine:lineNumber];
    }
}

- (void)assertMatcher:(id <HCMatcher>)matcher matching:(id)arg describesMismatch:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [matcher describeMismatchOf:arg to:description];
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failEqualityBetweenObject:actual andObject:expected
                            withMessage:@"Expected mismatch description"
                                 inFile:fileName atLine:lineNumber];
    }
}

@end
