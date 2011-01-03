//
//  OCHamcrest - HasCountTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCHasCount.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>

    // Test support
#import "FakeCountingObject.h"
#import "FakeNonCountingObject.h"


@interface HasCountTest : AbstractMatcherTest
@end


@implementation HasCountTest

- (id<HCMatcher>) createMatcher
{
    return hasCount(equalTo(@"irrelevant"));
}


- (void) testConvertCountToNSNumberAndPassToNestedMatcher
{
    NSUInteger fakeCount = 5;
    FakeCountingObject* fakeCountingObject = [FakeCountingObject fakeWithCount:fakeCount];
    assertThat(fakeCountingObject, hasCount(equalToUnsignedInteger(fakeCount)));
    assertThat(fakeCountingObject, isNot(hasCount(equalTo(equalToUnsignedInteger(fakeCount + 1)))));
}


- (void) testHasCountOfIsShortcutForEqualToUnsignedInteger
{
    NSUInteger fakeCount = 6;
    FakeCountingObject* fakeCountingObject = [FakeCountingObject fakeWithCount:fakeCount];
    assertThat(fakeCountingObject, hasCountOf(fakeCount));
    assertThat(fakeCountingObject, isNot(hasCountOf(fakeCount + 1)));
}


- (void) testHasReadableDescription
{
    id<HCMatcher> countMatcher = equalToUnsignedInteger(7);
    id<HCMatcher> matcher = hasCount(countMatcher);
    
    STAssertEqualObjects([matcher description],
                         ([NSString stringWithFormat:@"collection with count %@",
                                                    [countMatcher description]]),
                         nil);
}


- (void) testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was <counting> with count <42>",
                           hasCount(equalToUnsignedInteger(1)),
                           [FakeCountingObject fakeWithCount:42]);
}


- (void) testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <non-counting>",
                           hasCount(equalToUnsignedInteger(1)),
                           [FakeNonCountingObject fake]);
}

@end
