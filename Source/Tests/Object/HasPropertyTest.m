//
//  OCHamcrest - StringStartsWithTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
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

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSNumber *shoeSize;

@end

@implementation Person

@synthesize name,shoeSize;

- (id) initWithName:(NSString *)aName shoeSize:(int)aShoeSize
{
    if ((self = [super init]) != nil) {
        self.name = aName;
        self.shoeSize = [NSNumber numberWithInt:aShoeSize];
    }
    return self;
}

- (void) dealloc
{
    [name release];
    [super dealloc];
}

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
    assertDescription(@"an object with a property named <name> with a value of <\"Joe\">", hasProperty(@"name", @"Joe"));
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
