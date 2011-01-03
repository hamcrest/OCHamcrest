//
//  OCHamcrest - InvocationMatcherTest.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCInvocationMatcher.h>
#import <OCHamcrest/HCDescription.h>
#import <OCHamcrest/HCIsEqual.h>


@interface Match : HCIsEqual
@end

@implementation Match

+ (Match*) matches:(id)arg
{
    return [[[Match alloc] initEqualTo:arg] autorelease];
}

- (void) describeMismatchOf:(id)item to:(id<HCDescription>)description
{
    [description appendText:@"was mismatch"];
}

@end

//==================================================================================================

@interface Thingy : NSObject
{
    NSString* result;
}
@end


@implementation Thingy

- (id) initWithResult:(NSString*)aResult
{
    self = [super init];
    if (self != nil)
        result = [aResult retain];
    return self;
}

- (void) dealloc
{
    [result release];
    [super dealloc];
}

- (NSString*) description
{
    return @"Thingy";
}

- (NSString*) result
{
    return result;
}

+ (Thingy*) thingyWithResult:(NSString*)result
{
    return [[[Thingy alloc] initWithResult:result] autorelease];
}

@end

//==================================================================================================

@interface ShouldNotMatch : NSObject
@end

@implementation ShouldNotMatch

- (NSString*) description
{
    return @"ShouldNotMatch";
}

@end

//==================================================================================================

@interface InvocationMatcherTest : AbstractMatcherTest
{
    HCInvocationMatcher* resultMatcher;
}
@end


@implementation InvocationMatcherTest

- (void) setUp
{
    NSInvocation* invocation = [HCInvocationMatcher invocationForSelector:@selector(result)
                                                                  onClass:[Thingy class]];
    
    resultMatcher = [[HCInvocationMatcher alloc] initWithInvocation:invocation
                                                           matching:[Match matches:@"bar"]];
}


- (void) tearDown
{
    [resultMatcher release];
}


- (void) testMatchesFeature
{
    assertMatches(@"invoke on Thingy", resultMatcher, [Thingy thingyWithResult:@"bar"]);
    assertDescription(@"object with result \"bar\"", resultMatcher);
}


- (void) testMismatchWithDefaultLongDescription
{
    assertMismatchDescription(@"<Thingy> result was mismatch", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}


- (void) testMismatchWithShortDescription
{
    [resultMatcher setShortMismatchDescription:YES];
    assertMismatchDescription(@"was mismatch", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}


- (void) testDoesNotMatchNil
{
    assertMismatchDescription(@"was nil", resultMatcher, nil);
}


- (void) testDoesNotMatchObjectWithoutMethod
{
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher,
                       [[[ShouldNotMatch alloc] init] autorelease]);
}


- (void) testObjectWithoutMethodShortDescriptionIsSameAsLongForm
{
    [resultMatcher setShortMismatchDescription:YES];
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher,
                       [[[ShouldNotMatch alloc] init] autorelease]);
}

@end
