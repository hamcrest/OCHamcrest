//
//  OCHamcrest - MatcherAssertTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <SenTestingKit/SenTestingKit.h>

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCMatcherAssert.h>
#import <OCHamcrest/HCIsEqual.h>


@interface MatcherAssertTest : SenTestCase
@end

@implementation MatcherAssertTest

- (void) testErrorMessage
{
    NSString* expected = @"expected";
    NSString* actual = @"actual";
    
    NSString* expectedMessage = @"Expected \"expected\", got \"actual\"";
        
    @try
    {
        assertThat(actual, equalTo(expected));
    }
    @catch (NSException* exception)
    {
        STAssertTrue([[exception reason] rangeOfString:expectedMessage].location != NSNotFound, nil);
        return;
    }
    
    STFail(@"should have failed");
}


@end
