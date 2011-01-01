//
//  OCHamcrest - HCHasCountTest.m
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


static NSUInteger fakeCount = 42;

@interface FakeCountObject : NSObject
@end

@implementation FakeCountObject

+ (id) fakeCountObject { return [[[self alloc] init] autorelease]; }
- (NSUInteger) count { return fakeCount; }
- (NSString *) description { return @"counting"; }

@end


@interface FakeNonCountingObject : NSObject
@end

@implementation FakeNonCountingObject

+ (id) fakeNonCountingObject { return [[[self alloc] init] autorelease]; }
- (NSString *) description { return @"non-counting"; }

@end


@interface HasCountTest : AbstractMatcherTest
@end


@implementation HasCountTest

- (id<HCMatcher>) createMatcher
{
    return hasCount(equalTo(@"irrelevant"));
}


- (void) testConvertCountToNSNumberAndPassToNestedMatcher
{
    FakeCountObject* fakeCountObject = [FakeCountObject fakeCountObject];
    assertThat(fakeCountObject, hasCount(equalToUnsignedInteger(fakeCount)));
    assertThat(fakeCountObject, isNot(hasCount(equalTo(equalToUnsignedInteger(fakeCount + 1)))));
}


- (void) testHasCountOfIsShortcutForEqualToUnsignedInteger
{
    FakeCountObject* fakeCountObject = [FakeCountObject fakeCountObject];
    assertThat(fakeCountObject, hasCountOf(fakeCount));
    assertThat(fakeCountObject, isNot(hasCountOf(fakeCount + 1)));
}


- (void) testHasReadableDescription
{
    id<HCMatcher> countMatcher = equalToUnsignedInteger(fakeCount);
    id<HCMatcher> matcher = hasCount(countMatcher);
    
    STAssertEqualObjects([matcher description],
                         ([NSString stringWithFormat:@"collection with count of %@",
                                                    [countMatcher description]]),
                         nil);
}


- (void) testDescribesMismatchForItemWithWrongCount
{
    assertDescribeMismatch(@"was <counting> with count of <42>",
                           hasCount(equalToUnsignedInteger(1)),
                           [FakeCountObject fakeCountObject]);
}


- (void) testDescribesMismatchForItemWithoutCount
{
    assertDescribeMismatch(@"was <non-counting>",
                           hasCount(equalToUnsignedInteger(1)),
                           [FakeNonCountingObject fakeNonCountingObject]);
}

@end
