//
//  OCHamcrest - IsTypeOfTest.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsTypeOf.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface SomeClass : NSObject
@end

@implementation SomeClass
@end


@interface SomeSubclass : SomeClass
@end

@implementation SomeSubclass

- (NSString *)description
{
    return @"SOMESUBCLASS";
}

@end


#pragma mark -

@interface IsTypeOfTest : AbstractMatcherTest
@end

@implementation IsTypeOfTest

- (id<HCMatcher>)createMatcher
{
    return isA([SomeClass class]);
}

- (void)testEvaluatesToTrueIfArgumentIsInstanceOfGivenClass
{
    SomeClass *obj = [[SomeClass alloc] init];
    assertMatches(@"same class", isA([SomeClass class]), obj);
}

- (void)testEvaluatesToFalseIfArgumentIsSubclassOfGivenClass
{
    SomeSubclass *sub = [[SomeSubclass alloc] init];
    assertDoesNotMatch(@"subclass", isA([SomeClass class]), sub);
}

- (void)testEvaluatesToFalseIfArgumentIsInstanceOfDifferentClass
{
    assertDoesNotMatch(@"different class", isA([SomeClass class]), @"hi");
}

- (void)testEvaluatesToFalseIfArgumentIsNil
{
    assertDoesNotMatch(@"nil", isA([NSNumber class]), nil);
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    STAssertThrows(isA(nil), @"Should require non-nil argument");
}

- (void)testHasAReadableDescription
{
    assertDescription(@"an exact instance of SomeClass", isA([SomeClass class]));
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(isA([SomeClass class]), [[SomeClass alloc] init]);
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was SomeSubclass instance <SOMESUBCLASS>",
                              isA([SomeClass class]), [[SomeSubclass alloc] init]);
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was SomeSubclass instance <SOMESUBCLASS>",
                           isA([SomeClass class]), [[SomeSubclass alloc] init]);
}

@end
