//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCWrapInMatcher.h>

#import <XCTest/XCTest.h>


@interface HCWrapInMatcherTests : XCTestCase
@end

@implementation HCWrapInMatcherTests

- (void)testWrapInMatcher_WithNil_ShouldReturnNil
{
    XCTAssertNil(HCWrapInMatcher(nil));
}

@end
