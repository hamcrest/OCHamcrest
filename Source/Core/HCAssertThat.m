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


static NSString *makeStringDescribingMismatch(id matcher, id actual)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [[[description appendText:@"Expected "]
            appendDescriptionOf:matcher]
            appendText:@", but "];
    [matcher describeMismatchOf:actual to:description];
    return [description description];
}

static id <HCTestFailureHandler> makeFailureHandlerChain()
{
    HCXCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] init];
    HCSenTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] init];
    HCGenericTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] init];

    xctestHandler.successor = ocunitHandler;
    ocunitHandler.successor = genericHandler;

    return xctestHandler;
}

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                               const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        NSString *description = makeStringDescribingMismatch(matcher, actual);
        static id <HCTestFailureHandler> chain = nil;
        if (!chain)
            chain = makeFailureHandlerChain();
        [chain signalFailureInTestCase:testCase fileName:fileName lineNumber:lineNumber description:description];
    }
}

