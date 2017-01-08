//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCIsSame.h>

#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCStringDescription.h>

#import "MatcherTestCase.h"


@interface SameInstanceTests : MatcherTestCase
@end

@implementation SameInstanceTests

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = sameInstance(@"irrelevant");

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
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
    XCTAssertTrue([expected evaluateWithObject:description.description]);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    id o1 = [[NSObject alloc] init];
    assertNoMismatchDescription(sameInstance(o1), o1);
}

- (void)testMismatchDescriptionShowsActualArgumentAddress
{
    id matcher = sameInstance(@"foo");
    HCStringDescription *description = [HCStringDescription stringDescription];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES 'was 0x[0-9a-fA-F]+ \"hi\"'"];

    BOOL result = [matcher matches:@"hi" describingMismatchTo:description];
    XCTAssertFalse(result, @"Precondition: Matcher should not match item");
    XCTAssertTrue([expected evaluateWithObject:description.description]);
}

- (void)testMismatchDescriptionWithNilShouldNotIncludeAddress
{
    assertMismatchDescription(@"was nil", sameInstance(@"foo"), nil);
}

- (void)testDescribeMismatch
{
    id matcher = sameInstance(@"foo");
    HCStringDescription *description = [HCStringDescription stringDescription];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES 'was 0x[0-9a-fA-F]+ \"hi\"'"];

    [matcher describeMismatchOf:@"hi" to:description];
    XCTAssertTrue([expected evaluateWithObject:description.description]);
}

- (void)testDescribeMismatchWithNilShouldNotIncludeAddress
{
    assertDescribeMismatch(@"was nil", sameInstance(@"foo"), nil);
}

@end
