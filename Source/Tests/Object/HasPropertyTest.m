//
//  OCHamcrest - HasPropertyTest.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Justin Shacklette
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCHasProperty.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCIsNil.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
- (NSNumber *)shoeSize;
@end

@implementation Person
{
    NSNumber *_shoeSize;
}

- (instancetype)initWithName:(NSString *)name shoeSize:(int)shoeSize
{
    self = [super init];
    if (self)
    {
        _name = name;
        _shoeSize = [[NSNumber alloc] initWithInt:shoeSize];
    }
    return self;
}

- (NSNumber *)shoeSize
{
    return _shoeSize;
}

@end


@interface HasPropertyTest : AbstractMatcherTest
@end

@implementation HasPropertyTest
{
    Person *joe;
    Person *nobody;
}

- (void)setUp
{
    [super setUp];
    joe = [[Person alloc] initWithName:@"Joe" shoeSize:13];
    nobody = [[Person alloc] initWithName:nil shoeSize:0];
}

- (void)tearDown
{
    joe = nil;
    nobody = nil;
    [super tearDown];
}

- (id <HCMatcher>)createMatcher
{
    return hasProperty(@"irrelevant", @"irrelevant");
}

- (void)testCanMatchStringPropertyValues
{
    assertMatches(@"equal string property values", hasProperty(@"name", @"Joe"), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", @"Bob"), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", nil), joe);
}

- (void)testCanMatchStringPropertyValuesWithMatchers
{
    assertMatches(@"equal string property values", hasProperty(@"name", equalTo(@"Joe")), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", equalTo(@"Bob")), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", nilValue()), joe);
}

- (void)testCanMatchNumberPropertyValues
{
    assertMatches(@"equal int property values", hasProperty(@"shoeSize", equalTo(@13)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalTo(@3)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalTo(@-3)), joe);
}

- (void)testNilPropertyValues
{
    assertMatches(@"equal nil property values", hasProperty(@"name", nilValue()), nobody);
    assertDoesNotMatch(@"unequal nil property values", hasProperty(@"name", @"Bob"), nobody);
}

- (void)testMatcherCreationRequiresNonNilPropertyName
{    
    STAssertThrows(hasProperty(nil, nil), @"Should require non-nil property name");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an object with name \"Joe\"", hasProperty(@"name", @"Joe"));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(hasProperty(@"name", @"Joe"), joe);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", hasProperty(@"foo", @"foo"), @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", hasProperty(@"foo", @"foo"), @"bad");
}

@end


@interface ValueHolder : NSObject

@property (nonatomic, assign) BOOL boolValue;
@property (nonatomic, assign) char charValue;
@property (nonatomic, assign) int intValue;
@property (nonatomic, assign) short shortValue;
@property (nonatomic, assign) long longValue;
@property (nonatomic, assign) long long longLongValue;
@property (nonatomic, assign) unsigned char unsignedCharValue;
@property (nonatomic, assign) unsigned int unsignedIntValue;
@property (nonatomic, assign) unsigned short unsignedShortValue;
@property (nonatomic, assign) unsigned long unsignedLongValue;
@property (nonatomic, assign) unsigned long long unsignedLongLongValue;
@property (nonatomic, assign) float floatValue;
@property (nonatomic, assign) double doubleValue;

@end

@implementation ValueHolder
@end


@interface HasPropertyPrimitivesTest : AbstractMatcherTest
@end

@implementation HasPropertyPrimitivesTest
{
    ValueHolder *foo;
}

- (void)setUp
{
    [super setUp];
    foo = [[ValueHolder alloc] init];
}

- (void)tearDown
{
    foo = nil;
    [super tearDown];
}

- (void)testCanMatchPrimitiveBoolValues 
{
    foo.boolValue = YES;
    assertMatches(@"BOOL should match", hasProperty(@"boolValue", equalTo(@YES)), foo);
    assertDoesNotMatch(@"BOOL should not match", hasProperty(@"boolValue", equalTo(@NO)), foo);
}

- (void)testCanMatchPrimitiveCharValues 
{
    foo.charValue = 'a';
    assertMatches(@"char should match", hasProperty(@"charValue", equalTo(@'a')), foo);
    assertDoesNotMatch(@"char should not match", hasProperty(@"charValue", equalTo(@'b')), foo);
}

- (void)testCanMatchPrimitiveIntValues 
{
    foo.intValue = INT_MIN;
    assertMatches(@"int should match", hasProperty(@"intValue", equalTo(@INT_MIN)), foo);
    assertDoesNotMatch(@"int should not match", hasProperty(@"intValue", equalTo(@-2)), foo);
}

- (void)testCanMatchPrimitiveShortValues 
{
    foo.shortValue = -2;
    assertMatches(@"short should match", hasProperty(@"shortValue", equalTo(@-2)), foo);
    assertDoesNotMatch(@"short should not match", hasProperty(@"shortValue", equalTo(@-1)), foo);
}

- (void)testCanMatchPrimitiveLongValues 
{
    foo.longValue = LONG_MIN;
    assertMatches(@"long should match", hasProperty(@"longValue", equalTo(@LONG_MIN)), foo);
    assertDoesNotMatch(@"long should not match",
                       hasProperty(@"longValue", equalTo(@(LONG_MIN + 1))),
                       foo);
}

- (void)testCanMatchPrimitiveLongLongValues 
{
    foo.longLongValue = LONG_MIN - 1;
    assertMatches(@"long long should match",
                  hasProperty(@"longLongValue", equalTo(@(LONG_MIN - 1))),
                  foo);
    assertDoesNotMatch(@"long long should not match",
                       hasProperty(@"longLongValue", equalTo(@LONG_MIN)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedCharValues 
{
    foo.unsignedCharValue = 'b';
    assertMatches(@"unsigned char should match",
                  hasProperty(@"unsignedCharValue", equalTo(@'b')),
                  foo);
    assertDoesNotMatch(@"unsigned char should not match",
                       hasProperty(@"unsignedCharValue", equalTo(@'c')),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedIntValues 
{
    foo.unsignedIntValue = UINT_MAX;
    assertMatches(@"unsigned int should match",
                  hasProperty(@"unsignedIntValue", equalTo(@UINT_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned int should not match",
                       hasProperty(@"unsignedIntValue", equalTo(@(UINT_MAX - 1))),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedShortValues 
{
    foo.unsignedShortValue = 2;
    assertMatches(@"unsigned short should match",
                  hasProperty(@"unsignedShortValue", equalTo(@2)),
                  foo);
    assertDoesNotMatch(@"unsigned short should not match",
                       hasProperty(@"unsignedShortValue", equalTo(@3)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedLongValues 
{
    foo.unsignedLongValue = ULONG_MAX;
    assertMatches(@"unsigned long should match",
                  hasProperty(@"unsignedLongValue", equalTo(@ULONG_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned long should not match",
                       hasProperty(@"unsignedLongValue", equalTo(@(ULONG_MAX - 1))),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedLongLongValues 
{
    foo.unsignedLongLongValue = ULLONG_MAX;
    assertMatches(@"unsigned long long should match",
                  hasProperty(@"unsignedLongLongValue", equalTo(@ULLONG_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned long long should not match",
                       hasProperty(@"unsignedLongLongValue", equalTo(@(ULLONG_MAX - 1))),
                       foo);
}

- (void)testCanMatchPrimitiveFloatValues 
{
    foo.floatValue = 1.2f;
    assertMatches(@"float should match", hasProperty(@"floatValue", equalTo(@1.2f)), foo);
    assertDoesNotMatch(@"float should not match", hasProperty(@"floatValue", equalTo(@1.3f)), foo);
}

- (void)testCanMatchPrimitiveDoubleValues 
{
    foo.doubleValue = DBL_MAX;
    assertMatches(@"double should match", hasProperty(@"doubleValue", equalTo(@DBL_MAX)), foo);
    assertDoesNotMatch(@"double should not match",
                       hasProperty(@"doubleValue", equalTo(@3.14)),
                       foo);
}

@end
