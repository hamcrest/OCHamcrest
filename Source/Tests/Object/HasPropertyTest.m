//
//  OCHamcrest - HasPropertyTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
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
{
    NSString *name;
    NSNumber *shoeSize;
}

@property (nonatomic, retain) NSString *name;
- (NSNumber *)shoeSize;

@end

@implementation Person

@synthesize name;

- (id) initWithName:(NSString *)aName shoeSize:(int)aShoeSize
{
    self = [super init];
    if (self)
    {
        name = [aName retain];
        shoeSize = [[NSNumber alloc] initWithInt:aShoeSize];
    }
    return self;
}

- (void) dealloc
{
    [name release];
    [shoeSize release];
    [super dealloc];
}

- (NSNumber *)shoeSize
{
    return shoeSize;
}

@end

@interface ValueHolder : NSObject {
    int intValue;
    short shortValue;
    long longValue;
    long long longLongValue;
    float floatValue;
    double doubleValue;
    char charValue;
    unsigned int unsignedIntValue;
    unsigned short unsignedShortValue;
    unsigned long unsignedLongValue;
    unsigned long long unsignedLongLongValue;
    unsigned char unsignedCharValue;
    BOOL boolValue;    
}

@property int intValue;
@property short shortValue;
@property long longValue;
@property long long longLongValue;
@property float floatValue;
@property double doubleValue;
@property char charValue;
@property unsigned int unsignedIntValue;
@property unsigned short unsignedShortValue;
@property unsigned long unsignedLongValue;
@property unsigned long long unsignedLongLongValue;
@property unsigned char unsignedCharValue;
@property BOOL boolValue;

@end

@implementation ValueHolder

@synthesize intValue, shortValue, longValue, longLongValue, floatValue, doubleValue, charValue;
@synthesize unsignedIntValue, unsignedShortValue, unsignedLongValue, unsignedLongLongValue, unsignedCharValue;
@synthesize boolValue;

@end

#pragma mark -

@interface HasPropertyTest : AbstractMatcherTest
{
    Person *joe;
    Person *nobody;
}
@end

@implementation HasPropertyTest

- (void)setUp
{
    [super setUp];
    joe = [[Person alloc] initWithName:@"Joe" shoeSize:13];
    nobody = [[Person alloc] initWithName:nil shoeSize:0];
}

- (void)tearDown
{
    [joe release];
    [nobody release];
    [super tearDown];
}

- (id<HCMatcher>)createMatcher
{
    return hasProperty(@"foo", @"foo");
}

- (void)testStringPropertyValues
{
    assertMatches(@"equal string property values", hasProperty(@"name", @"Joe"), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", @"Bob"), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", nil), joe);
}

- (void)testStringPropertyValuesWithMatchers
{
    assertMatches(@"equal string property values", hasProperty(@"name", equalTo(@"Joe")), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", equalTo(@"Bob")), joe);
    assertDoesNotMatch(@"unequal string property values", hasProperty(@"name", nilValue()), joe);
}

- (void)testNumberPropertyValues
{
    assertMatches(@"equal int property values", hasProperty(@"shoeSize", equalToInt(13)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalToInt(3)), joe);
    assertDoesNotMatch(@"unequal int property values", hasProperty(@"shoeSize", equalToInt(-3)), joe);
}

- (void)testCanMatchPrimitiveValues 
{
    ValueHolder *foo = [[ValueHolder alloc] init];
    foo.intValue = INT_MIN;
    foo.shortValue = -2;
    foo.longValue = LONG_MIN;
    foo.longLongValue = LONG_MIN - 1;
    foo.unsignedIntValue = UINT_MAX;
    foo.unsignedShortValue = 2;
    foo.unsignedLongValue = ULONG_MAX;
    foo.unsignedLongLongValue = ULONG_LONG_MAX;
    foo.charValue = 'a';
    foo.unsignedCharValue = 'b';
    foo.floatValue = 1.2;
    foo.doubleValue = DBL_MAX;
    foo.boolValue = YES;
    
    assertMatches(@"int should match INT_MIN", hasProperty(@"intValue", equalToInt(INT_MIN)), foo);
    assertMatches(@"short should match -2", hasProperty(@"shortValue", equalToShort(-2)), foo);
    assertMatches(@"long should match LONG_MIN", hasProperty(@"longValue", equalToLong(LONG_MIN)), foo);
    assertMatches(@"long long should match LONG_MIN - 1", hasProperty(@"longLongValue", equalToLongLong(LONG_MIN - 1)), foo);
    assertMatches(@"unsigned int should match UINT_MAX", hasProperty(@"unsignedIntValue", equalToUnsignedInt(UINT_MAX)), foo);
    assertMatches(@"unsigned short should match 2", hasProperty(@"unsignedShortValue", equalToUnsignedShort(2)), foo);
    assertMatches(@"unsigned long should match ULONG_MAX", hasProperty(@"unsignedLongValue", equalToUnsignedLong(ULONG_MAX)), foo);
    assertMatches(@"unsigned long long should match ULONG_LONG_MAX", hasProperty(@"unsignedLongLongValue", equalToUnsignedLongLong(ULONG_LONG_MAX)), foo);
    assertMatches(@"char should match a", hasProperty(@"charValue", equalToChar('a')), foo);
    assertMatches(@"unsigned char should match b", hasProperty(@"unsignedCharValue", equalToUnsignedChar('b')), foo);
    assertMatches(@"float should match 1.2", hasProperty(@"floatValue", equalToFloat(1.2)), foo);
    assertMatches(@"double should match DBL_MAX", hasProperty(@"doubleValue", equalToDouble(DBL_MAX)), foo);
    assertMatches(@"bool should match YES", hasProperty(@"boolValue", equalToBool(YES)), foo);
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
