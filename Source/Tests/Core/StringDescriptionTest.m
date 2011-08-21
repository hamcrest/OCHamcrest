//
//  OCHamcrest - StringDescriptionTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Class under test
#import <OCHamcrest/HCStringDescription.h>

    // Collaborators
#import <OCHamcrest/HCSelfDescribing.h>

    // Test support
#import <SenTestingKit/SenTestingKit.h>


@interface FakeSelfDescribing : NSObject <HCSelfDescribing>
@end

@implementation FakeSelfDescribing

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"DESCRIPTION"];
}

@end


#pragma mark -

@interface ObjectWithNilDescription : NSObject
@end

@implementation ObjectWithNilDescription

- (NSString *)description
{
    return nil;
}

@end


#pragma mark -

@interface StringDescriptionTest : SenTestCase
{
    HCStringDescription *description;
}
@end

@implementation StringDescriptionTest

- (void)setUp
{
    [super setUp];
    description = [[HCStringDescription alloc] init];
}

- (void)tearDown
{
    [description release];
    [super tearDown];
}

- (void)testDescribesNil
{
    [description appendDescriptionOf:nil];
    
    STAssertEqualObjects(@"nil", [description description], nil);
}

- (void)testLetsSelfDescribingObjectDescribeItself
{
    [description appendDescriptionOf:[[[FakeSelfDescribing alloc] init] autorelease]];
    
    STAssertEqualObjects(@"DESCRIPTION", [description description], nil);
}

- (void)testDescribesStringInQuotes
{    
    [description appendDescriptionOf:@"FOO"];
    
    STAssertEqualObjects(@"\"FOO\"", [description description], nil);
}

- (void)testWrapsNonSelfDescribingObjectInAngleBrackets
{    
    [description appendDescriptionOf:[NSNumber numberWithInt:42]];
    
    STAssertEqualObjects(@"<42>", [description description], nil);
}

- (void)testShouldNotAddAngleBracketsIfObjectDescriptionAlreadyHasThem
{
    [description appendDescriptionOf:[[[NSObject alloc] init] autorelease]];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES '<NSObject: 0x[0-9a-fA-F]+>'"];
    STAssertTrue([expected evaluateWithObject:[description description]], nil);
}

- (void)testCanDescribeObjectWithNilDescription
{
    [description appendDescriptionOf:[[[ObjectWithNilDescription alloc] init] autorelease]];
    NSPredicate *expected = [NSPredicate predicateWithFormat:
                             @"SELF MATCHES '<ObjectWithNilDescription: 0x[0-9a-fA-F]+>'"];
    STAssertTrue([expected evaluateWithObject:[description description]], nil);
}

@end
