//  OCHamcrest by Jon Reid, https://qualitycoding.org/
//  Copyright 2018 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCWrapInMatcher.h>

@import XCTest;


@interface HCWrapInMatcherTests : XCTestCase
@end

@implementation HCWrapInMatcherTests

- (void)testWrapInMatcher_WithNil_ShouldReturnNil
{
    XCTAssertNil(HCWrapInMatcher(nil));
}

@end
