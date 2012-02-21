//
//  OCHamcrest - InvocationMatcherTest.mm
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
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
    return [[[Match alloc] initEqualTo:arg] autorelease];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)description
{
    [description appendText:@"MISMATCH"];
}

@end


#pragma mark -

@interface Thingy : NSObject
{
    NSString *result;
}
@end

@implementation Thingy

- (id)initWithResult:(NSString *)aResult
{
    self = [super init];
    if (self)
        result = [aResult retain];
    return self;
}

- (void)dealloc
{
    [result release];
    [super dealloc];
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
    return [[[Thingy alloc] initWithResult:result] autorelease];
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
{
    HCInvocationMatcher *resultMatcher;
}
@end

@implementation InvocationMatcherTest

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
    [resultMatcher release];
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
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher,
                       [[[ShouldNotMatch alloc] init] autorelease]);
}

- (void)testObjectWithoutMethodShortDescriptionIsSameAsLongForm
{
    [resultMatcher setShortMismatchDescription:YES];
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher,
                       [[[ShouldNotMatch alloc] init] autorelease]);
}

@end
