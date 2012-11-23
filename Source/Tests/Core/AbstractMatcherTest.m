//
//  OCHamcrest - AbstractMatcherTest.h
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "AbstractMatcherTest.h"

#import <OCHamcrest/HCMatcher.h>
#import <OCHamcrest/HCStringDescription.h>


@implementation AbstractMatcherTest

- (void)assertTrue:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    if (!condition)
    {
        [self failWithException:[NSException failureInFile:@(fileName)
                                                    atLine:lineNumber
                                           withDescription:message]];
    }
}

- (void)assertFalse:(BOOL)condition message:(NSString *)message
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    if (condition)
    {
        [self failWithException:[NSException failureInFile:@(fileName)
                                                    atLine:lineNumber
                                           withDescription:message]];
    }
}

- (void)assertMatcher:(id<HCMatcher>)matcher hasTheDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [description appendDescriptionOf:matcher];
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failWithException:
                [NSException failureInEqualityBetweenObject:actual
                                                  andObject:expected
                                                     inFile:@(fileName)
                                                     atLine:lineNumber
                                            withDescription:@"Expected description"]];
    }
}

- (void)assertMatcher:(id<HCMatcher>)matcher hasNoMismatchDescriptionFor:(id)arg
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    BOOL result = [matcher matches:arg];
    if (!result)
    {
        [self failWithException:[NSException failureInFile:@(fileName)
                                                    atLine:lineNumber
                                           withDescription:@"Precondition: Matcher should match item"]];
    }
    if ([[description description] length] != 0)
    {
        [self failWithException:[NSException failureInFile:@(fileName)
                                                    atLine:lineNumber
                                           withDescription:@"Expected no mismatch description"]];
    }
}

- (void)assertMatcher:(id<HCMatcher>)matcher matching:(id)arg yieldsMismatchDescription:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    BOOL result = [matcher matches:arg describingMismatchTo:description];
    if (result)
    {
        [self failWithException:[NSException failureInFile:@(fileName)
                                                    atLine:lineNumber
                                           withDescription:@"Precondition: Matcher should not match item"]];
    }
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failWithException:
                [NSException failureInEqualityBetweenObject:actual
                                                  andObject:expected
                                                     inFile:@(fileName)
                                                     atLine:lineNumber
                                            withDescription:@"Expected mismatch description"]];
    }
}

- (void)assertMatcher:(id<HCMatcher>)matcher matching:(id)arg describesMismatch:(NSString *)expected
                inFile:(const char *)fileName atLine:(int)lineNumber
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [matcher describeMismatchOf:arg to:description];
    NSString *actual = [description description];
    if (![actual isEqualToString:expected])
    {
        [self failWithException:
                [NSException failureInEqualityBetweenObject:actual
                                                  andObject:expected
                                                     inFile:@(fileName)
                                                     atLine:lineNumber
                                            withDescription:@"Expected mismatch description"]];
    }
}

- (id<HCMatcher>)createMatcher
{
    return nil;     // Override in subclass
}

- (void)testIsNilSafe
{
    // Should not crash or throw exception.
    [[self createMatcher] matches:nil];
}

- (void)testCopesWithUnknownTypes
{
    // Should not crash or throw exception.
    [[self createMatcher] matches:[[NSObject alloc] init]];
}

@end
