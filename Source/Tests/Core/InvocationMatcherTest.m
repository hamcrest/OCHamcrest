//
//  OCHamcrest - InvocationMatcherTest.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCInvocationMatcher.h>

    // Collaborators
#import <OCHamcrest/HCDescription.h>
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface Match : HCIsEqual
@end

@implementation Match

+ (Match *)matches:(id)arg
{
    return [[Match alloc] initEqualTo:arg];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)description
{
    [description appendText:@"MISMATCH"];
}

@end


#pragma mark -

@interface Thingy : NSObject
@end

@implementation Thingy
{
    NSString *result;
}

- (id)initWithResult:(NSString *)aResult
{
    self = [super init];
    if (self)
        result = aResult;
    return self;
}

- (NSString *)description
{
    return @"Thingy";
}

- (NSString *)result
{
    return result;
}

+ (Thingy*) thingyWithResult:(NSString *)result
{
    return [[Thingy alloc] initWithResult:result];
}

@end


#pragma mark -

@interface ShouldNotMatch : NSObject
@end

@implementation ShouldNotMatch

- (NSString *)description
{
    return @"ShouldNotMatch";
}

@end


#pragma mark -

@interface InvocationMatcherTest : AbstractMatcherTest
@end

@implementation InvocationMatcherTest
{
    HCInvocationMatcher *resultMatcher;
}

- (void)setUp
{
    [super setUp];
    NSInvocation *invocation = [HCInvocationMatcher invocationForSelector:@selector(result)
                                                                  onClass:[Thingy class]];
    
    resultMatcher = [[HCInvocationMatcher alloc] initWithInvocation:invocation
                                                           matching:[Match matches:@"bar"]];
}

- (void)tearDown
{
    resultMatcher = nil;
    [super tearDown];
}

- (void)testMatchesFeature
{
    assertMatches(@"invoke on Thingy", resultMatcher, [Thingy thingyWithResult:@"bar"]);
    assertDescription(@"an object with result \"bar\"", resultMatcher);
}

- (void)testMismatchWithDefaultLongDescription
{
    assertMismatchDescription(@"<Thingy> result MISMATCH", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}

- (void)testMismatchWithShortDescription
{
    [resultMatcher setShortMismatchDescription:YES];
    assertMismatchDescription(@"MISMATCH", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}

- (void)testDoesNotMatchNil
{
    assertMismatchDescription(@"was nil", resultMatcher, nil);
}

- (void)testDoesNotMatchObjectWithoutMethod
{
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher, [[ShouldNotMatch alloc] init]);
}

- (void)testObjectWithoutMethodShortDescriptionIsSameAsLongForm
{
    [resultMatcher setShortMismatchDescription:YES];
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher, [[ShouldNotMatch alloc] init]);
}

@end
