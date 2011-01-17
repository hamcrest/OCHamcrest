//
//  OCHamcrest - HasCountTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCHasCount.h>

    // Other OCHamcrest
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCIsNot.h>

    // Test support
#import "AbstractMatcherTest.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


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
    FakeWithCount* fakeWithCount = [FakeWithCount fakeWithCount:fakeCount];
    assertThat(fakeWithCount, hasCount(equalToUnsignedInteger(fakeCount)));
    assertThat(fakeWithCount, isNot(hasCount(equalTo(equalToUnsignedInteger(fakeCount + 1)))));
}


- (void) testHasCountOfIsShortcutForEqualToUnsignedInteger
{
    NSUInteger fakeCount = 6;
    FakeWithCount* fakeWithCount = [FakeWithCount fakeWithCount:fakeCount];
    assertThat(fakeWithCount, hasCountOf(fakeCount));
    assertThat(fakeWithCount, isNot(hasCountOf(fakeCount + 1)));
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
                           [FakeWithCount fakeWithCount:42]);
}


- (void) testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <non-counting>",
                           hasCount(equalToUnsignedInteger(1)),
                           [FakeWithoutCount fake]);
}

@end
