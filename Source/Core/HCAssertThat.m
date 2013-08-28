//
//  OCHamcrest - HCAssertThat.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCAssertThat.h"

#import "HCStringDescription.h"
#import "HCMatcher.h"
#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"
#import "HCTestFailure.h"


static id <HCTestFailureHandler> makeFailureHandlerChain()
{
    HCXCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] init];
    HCSenTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] init];
    HCGenericTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] init];

    xctestHandler.successor = ocunitHandler;
    ocunitHandler.successor = genericHandler;

    return xctestHandler;
}

static NSString *describeMismatch(id matcher, id actual)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [[[description appendText:@"Expected "]
            appendDescriptionOf:matcher]
            appendText:@", but "];
    [matcher describeMismatchOf:actual to:description];
    return [description description];
}

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                               const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        static id <HCTestFailureHandler> chain = nil;
        if (!chain)
            chain = makeFailureHandlerChain();
        HCTestFailure *failure = [[HCTestFailure alloc] initWithTestCase:testCase
                                                                fileName:[NSString stringWithUTF8String:fileName]
                                                              lineNumber:(NSUInteger)lineNumber
                                                                  reason:describeMismatch(matcher, actual)];
        [chain handleFailure:failure];
    }
}

