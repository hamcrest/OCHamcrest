//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCStringDescription.h>

#import <OCHamcrest/HCSelfDescribing.h>

#import <XCTest/XCTest.h>


@interface FakeSelfDescribing : NSObject <HCSelfDescribing>
@end

@implementation FakeSelfDescribing

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"DESCRIPTION"];
}

@end


@interface ObjectDescriptionWithLessThan : NSObject
@end

@implementation ObjectDescriptionWithLessThan

- (NSString *)description
{
    return @"< is less than";
}

@end


@interface ObjectWithNilDescription : NSObject
@end

@implementation ObjectWithNilDescription

- (NSString *)description
{
    return nil;
}

@end


@interface ProxyObjectSuchAsMock : NSProxy
@property (nonatomic, copy, readonly) NSString *descriptionText;
@end

@implementation ProxyObjectSuchAsMock

- (instancetype)initWithDescription:(NSString *)description
{
    _descriptionText = [description copy];
    return self;
}

- (NSString *)description
{
    return self.descriptionText;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [[NSObject class] methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
}

@end


@interface HCStringDescriptionTests : XCTestCase
@end

@implementation HCStringDescriptionTests
{
    HCStringDescription *description;
}

- (void)setUp
{
    [super setUp];
    description = [[HCStringDescription alloc] init];
}

- (void)tearDown
{
    description = nil;
    [super tearDown];
}

- (void)testDescribesNil
{
    [description appendDescriptionOf:nil];

    XCTAssertEqualObjects(description.description, @"nil");
}

- (void)testLetsSelfDescribingObjectDescribeItself
{
    [description appendDescriptionOf:[[FakeSelfDescribing alloc] init]];

    XCTAssertEqualObjects(description.description, @"DESCRIPTION");
}

- (void)testDescribesStringInQuotes
{
    [description appendDescriptionOf:@"FOO"];

    XCTAssertEqualObjects(description.description, @"\"FOO\"");
}

- (void)testDescriptionOfStringWithQuotesShouldExpandToCSyntax
{
    [description appendDescriptionOf:@"a\"b"];

    XCTAssertEqualObjects(description.description, @"\"a\\\"b\"");
}

- (void)testDescriptionOfStringWithNewlineShouldExpandToCSyntax
{
    [description appendDescriptionOf:@"a\nb"];

    XCTAssertEqualObjects(description.description, @"\"a\\nb\"");
}

- (void)testDescriptionOfStringWithCarriageReturnShouldExpandToCSyntax
{
    [description appendDescriptionOf:@"a\rb"];

    XCTAssertEqualObjects(description.description, @"\"a\\rb\"");
}

- (void)testDescriptionOfStringWithTabShouldExpandToCSyntax
{
    [description appendDescriptionOf:@"a\tb"];

    XCTAssertEqualObjects(description.description, @"\"a\\tb\"");
}

- (void)testWrapsNonSelfDescribingObjectInAngleBrackets
{
    [description appendDescriptionOf:@42];

    XCTAssertEqualObjects(description.description, @"<42>");
}

- (void)testShouldNotAddAngleBracketsIfObjectDescriptionAlreadyHasThem
{
    [description appendDescriptionOf:[[NSObject alloc] init]];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES '<NSObject: 0x[0-9a-fA-F]+>'"];
    XCTAssertTrue([expected evaluateWithObject:description.description]);
}

- (void)testWrapsNonSelfDescribingObjectInAngleBracketsIfItDoesNotEndInClosingBracket
{
    ObjectDescriptionWithLessThan *lessThanDescription = [[ObjectDescriptionWithLessThan alloc] init];
    [description appendDescriptionOf:lessThanDescription];

    XCTAssertEqualObjects(description.description, @"<< is less than>");
}

- (void)testCanDescribeObjectWithNilDescription
{
    [description appendDescriptionOf:[[ObjectWithNilDescription alloc] init]];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES '<ObjectWithNilDescription: 0x[0-9a-fA-F]+>'"];
    XCTAssertTrue([expected evaluateWithObject:description.description]);
}

- (void)testAppendListWithEmptyListShouldHaveStartAndEndOnly
{
    [description appendList:@[]
                      start:@"["
                  separator:@","
                        end:@"]"];

    XCTAssertEqualObjects(description.description, @"[]");
}

- (void)testAppendListWithOneItemShouldHaveStartItemAndEnd
{
    [description appendList:@[@"a"]
                      start:@"["
                  separator:@","
                        end:@"]"];

    XCTAssertEqualObjects(description.description, @"[\"a\"]");
}

- (void)testAppendListWithTwoItemsShouldHaveItemsWithSeparator
{
    [description appendList:@[@"a", @"b"]
                      start:@"["
                  separator:@","
                        end:@"]"];

    XCTAssertEqualObjects(description.description, @"[\"a\",\"b\"]");
}

- (void)testAbleToDescribeProxyObject
{
    id proxy = [[ProxyObjectSuchAsMock alloc] initWithDescription:@"DESCRIPTION"];

    [description appendDescriptionOf:proxy];

    XCTAssertEqualObjects(description.description, @"<DESCRIPTION>");
}

@end
