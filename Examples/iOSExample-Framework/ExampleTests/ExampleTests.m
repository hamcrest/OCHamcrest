#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>  // Specify OCHamcrestIOS for prebuilt framework

@interface ExampleTests : XCTestCase
@end

@implementation ExampleTests

- (void)testUsingAssertThat
{
    assertThat(@"xx", is(@"xx"));
    assertThat(@"yy", isNot(@"xx"));
    assertThat(@"i like cheese", containsString(@"cheese"));
}

- (void)testUsingNumbers
{
    assertThatInt(42, is(@42));
    assertThatUnsignedShort(6 * 9, isNot(@42U));
}

@end
