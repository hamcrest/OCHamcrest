//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCThrowsException.h>

#import <OCHamcrest/HCHasProperty.h>
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsSame.h>

#import "MatcherTestCase.h"


@interface ThrowsExceptionTests : MatcherTestCase
@end

@implementation ThrowsExceptionTests

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
    XCTAssertThrows(throwsException([[NSObject alloc] init]), @"Should require matcher argument");
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
