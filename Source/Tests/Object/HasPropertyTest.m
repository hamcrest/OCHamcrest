//
//  OCHamcrest - HasPropertyTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
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
@property (copy, nonatomic) NSString *name;
- (NSNumber *)shoeSize;
@end

@implementation Person
{
    NSNumber *_shoeSize;
}

- (id) initWithName:(NSString *)name shoeSize:(int)shoeSize
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


#pragma mark -

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

- (id<HCMatcher>)createMatcher
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
    assertMatches(@"equal int property values", hasProperty(@"shoeSize", equalToInt(13)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalToInt(3)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalToInt(-3)), joe);
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


#pragma mark -

@interface ValueHolder : NSObject

@property (assign, nonatomic) BOOL boolValue;
@property (assign, nonatomic) char charValue;
@property (assign, nonatomic) int intValue;
@property (assign, nonatomic) short shortValue;
@property (assign, nonatomic) long longValue;
@property (assign, nonatomic) long long longLongValue;
@property (assign, nonatomic) unsigned char unsignedCharValue;
@property (assign, nonatomic) unsigned int unsignedIntValue;
@property (assign, nonatomic) unsigned short unsignedShortValue;
@property (assign, nonatomic) unsigned long unsignedLongValue;
@property (assign, nonatomic) unsigned long long unsignedLongLongValue;
@property (assign, nonatomic) float floatValue;
@property (assign, nonatomic) double doubleValue;

@end

@implementation ValueHolder
@end


#pragma mark -

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
    assertMatches(@"BOOL should match", hasProperty(@"boolValue", equalToBool(YES)), foo);
    assertDoesNotMatch(@"BOOL should not match", hasProperty(@"boolValue", equalToBool(NO)), foo);
}

- (void)testCanMatchPrimitiveCharValues 
{
    foo.charValue = 'a';
    assertMatches(@"char should match", hasProperty(@"charValue", equalToChar('a')), foo);
    assertDoesNotMatch(@"char should not match", hasProperty(@"charValue", equalToChar('b')), foo);
}

- (void)testCanMatchPrimitiveIntValues 
{
    foo.intValue = INT_MIN;
    assertMatches(@"int should match", hasProperty(@"intValue", equalToInt(INT_MIN)), foo);
    assertDoesNotMatch(@"int should not match", hasProperty(@"intValue", equalToInt(-2)), foo);
}

- (void)testCanMatchPrimitiveShortValues 
{
    foo.shortValue = -2;
    assertMatches(@"short should match", hasProperty(@"shortValue", equalToShort(-2)), foo);
    assertDoesNotMatch(@"short should not match", hasProperty(@"shortValue", equalToShort(-1)), foo);
}

- (void)testCanMatchPrimitiveLongValues 
{
    foo.longValue = LONG_MIN;
    assertMatches(@"long should match", hasProperty(@"longValue", equalToLong(LONG_MIN)), foo);
    assertDoesNotMatch(@"long should not match",
                       hasProperty(@"longValue", equalToLong(LONG_MIN + 1)),
                       foo);
}

- (void)testCanMatchPrimitiveLongLongValues 
{
    foo.longLongValue = LONG_MIN - 1;
    assertMatches(@"long long should match",
                  hasProperty(@"longLongValue", equalToLongLong(LONG_MIN - 1)),
                  foo);
    assertDoesNotMatch(@"long long should not match",
                       hasProperty(@"longLongValue", equalToLongLong(LONG_MIN)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedCharValues 
{
    foo.unsignedCharValue = 'b';
    assertMatches(@"unsigned char should match",
                  hasProperty(@"unsignedCharValue", equalToUnsignedChar('b')),
                  foo);
    assertDoesNotMatch(@"unsigned char should not match",
                       hasProperty(@"unsignedCharValue", equalToUnsignedChar('c')),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedIntValues 
{
    foo.unsignedIntValue = UINT_MAX;
    assertMatches(@"unsigned int should match",
                  hasProperty(@"unsignedIntValue", equalToUnsignedInt(UINT_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned int should not match",
                       hasProperty(@"unsignedIntValue", equalToUnsignedInt(UINT_MAX - 1)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedShortValues 
{
    foo.unsignedShortValue = 2;
    assertMatches(@"unsigned short should match",
                  hasProperty(@"unsignedShortValue", equalToUnsignedShort(2)),
                  foo);
    assertDoesNotMatch(@"unsigned short should not match",
                       hasProperty(@"unsignedShortValue", equalToUnsignedShort(3)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedLongValues 
{
    foo.unsignedLongValue = ULONG_MAX;
    assertMatches(@"unsigned long should match",
                  hasProperty(@"unsignedLongValue", equalToUnsignedLong(ULONG_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned long should not match",
                       hasProperty(@"unsignedLongValue", equalToUnsignedLong(ULONG_MAX - 1)),
                       foo);
}

- (void)testCanMatchPrimitiveUnsignedLongLongValues 
{
    foo.unsignedLongLongValue = ULLONG_MAX;
    assertMatches(@"unsigned long long should match",
                  hasProperty(@"unsignedLongLongValue", equalToUnsignedLongLong(ULLONG_MAX)),
                  foo);
    assertDoesNotMatch(@"unsigned long long should not match",
                       hasProperty(@"unsignedLongLongValue", equalToUnsignedLongLong(ULLONG_MAX - 1)),
                       foo);
}

- (void)testCanMatchPrimitiveFloatValues 
{
    foo.floatValue = 1.2f;
    assertMatches(@"float should match", hasProperty(@"floatValue", equalToFloat(1.2f)), foo);
    assertDoesNotMatch(@"float should not match", hasProperty(@"floatValue", equalToFloat(1.3f)), foo);
}

- (void)testCanMatchPrimitiveDoubleValues 
{
    foo.doubleValue = DBL_MAX;
    assertMatches(@"double should match", hasProperty(@"doubleValue", equalToDouble(DBL_MAX)), foo);
    assertDoesNotMatch(@"double should not match",
                       hasProperty(@"doubleValue", equalToDouble(3.14)),
                       foo);
}

@end
