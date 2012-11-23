//
//  OCHamcrest - IsSameTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsSame.h>

    // Collaborators
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCStringDescription.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsSameTest : AbstractMatcherTest
@end

@implementation IsSameTest

- (id<HCMatcher>)createMatcher
{
    return sameInstance(@"irrelevant");
}

- (void)testEvaluatesToTrueIfArgumentIsReferenceToASpecifiedObject
{
    id o1 = [[NSObject alloc] init];
    id o2 = [[NSObject alloc] init];

    assertThat(o1, sameInstance(o1));
    assertThat(o2, isNot(sameInstance(o1)));
}

- (void)testDoesNotMatchEqualObjects
{
    NSString *string1 = @"foobar";
    NSString *string2 = [@"foo" stringByAppendingString:@"bar"];

    assertDoesNotMatch(@"not the same object", sameInstance(string1), string2);
}

- (void)testDescriptionIncludesMemoryAddress
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES 'same instance as 0x[0-9a-fA-F]+ \"abc\"'"];

    [description appendDescriptionOf:sameInstance(@"abc")];
    STAssertTrue([expected evaluateWithObject:[description description]], nil);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    id o1 = [[NSObject alloc] init];
    assertNoMismatchDescription(sameInstance(o1), o1);
}

- (void)testMismatchDescriptionShowsActualArgumentAddress
{
    id<HCMatcher> matcher = sameInstance(@"foo");
    HCStringDescription *description = [HCStringDescription stringDescription];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES 'was 0x[0-9a-fA-F]+ \"hi\"'"];

    BOOL result = [matcher matches:@"hi" describingMismatchTo:description];
    STAssertFalse(result, @"Precondition: Matcher should not match item");
    STAssertTrue([expected evaluateWithObject:[description description]], nil);
}

- (void)testMismatchDescriptionWithNilShouldNotIncludeAddress
{
    assertMismatchDescription(@"was nil", sameInstance(@"foo"), nil);
}

- (void)testDescribeMismatch
{
    id<HCMatcher> matcher = sameInstance(@"foo");
    HCStringDescription *description = [HCStringDescription stringDescription];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES 'was 0x[0-9a-fA-F]+ \"hi\"'"];

    [matcher describeMismatchOf:@"hi" to:description];
    STAssertTrue([expected evaluateWithObject:[description description]], nil);
}

- (void)testDescribeMismatchWithNilShouldNotIncludeAddress
{
    assertDescribeMismatch(@"was nil", sameInstance(@"foo"), nil);
}

@end
