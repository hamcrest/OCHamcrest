//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCThrowsException.h>

    // Collaborators
#import <OCHamcrest/HCHasProperty.h>
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsSame.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface ThrowsExceptionTest : AbstractMatcherTest
@end

@implementation ThrowsExceptionTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = throwsException(anything());

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testDoesNotMatchBlockNotThrowingException
{
    id matcher = throwsException(anything());

    assertDoesNotMatch(@"does not throw", matcher, ^{});
}

- (void)testMatchesBlockThrowingExceptionSatisfyingMatcher
{
    NSException *exception = [NSException exceptionWithName:@"" reason:@"" userInfo:nil];
    id matcher = throwsException(sameInstance(exception));

    assertMatches(@"throws matching exception", matcher, ^{ @throw exception; });
}

- (void)testDoesNotMatchBlockThrowingExceptionNotSatisfyingMatcher
{
    id matcher = throwsException(hasProperty(@"name", @"FOO"));

    assertDoesNotMatch(@"throws non-matching exception", matcher,
            ^{ @throw [NSException exceptionWithName:@"BAR" reason:@"" userInfo:nil]; });
}

- (void)testDoesNotMatchNonBlock
{
    id matcher = throwsException(anything());

    assertDoesNotMatch(@"not a block", matcher, [[NSObject alloc] init]);
}

- (void)testMatcherCreationRequiresMatcherArgument
{
    STAssertThrows(throwsException([[NSObject alloc] init]), @"Should require matcher argument");
}

- (void)testHasReadableDescription
{
    assertDescription(@"a block with no arguments, throwing an exception which is an object with name \"FOO\"",
            throwsException(hasProperty(@"name", @"FOO")));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    id matcher = throwsException(anything());

    assertNoMismatchDescription(matcher,
            ^{ @throw [NSException exceptionWithName:@"" reason:@"" userInfo:nil]; });
}

- (void)testMismatchDescription_OnNonBlock_ShouldSayNeedABlock
{
    id matcher = throwsException(anything());

    assertMismatchDescription(@"was non-block nil", matcher, nil);
}

- (void)testMismatchDescription_OnBlockNotThrowingException_ShouldSayNoThrow
{
    id matcher = throwsException(anything());

    assertMismatchDescription(@"no exception thrown", matcher, ^{});
}

- (void)testMismatchDescription_OnBlockThrowingExceptionNotSatisfyingMatcher
{
    id matcher = throwsException(hasProperty(@"name", @"FOO"));

    assertMismatchDescriptionPrefix(@"exception thrown but name was \"BAR\" on <NSException:",
            matcher, ^{ @throw [NSException exceptionWithName:@"BAR" reason:@"" userInfo:nil]; });
}

@end
