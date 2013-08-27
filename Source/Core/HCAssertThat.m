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
#import "HCTestFailureHandler.h"
#import "HCTestFailureHandlerFactory.h"


static NSString *makeStringDescribingMismatch(id matcher, id actual)
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
        NSString *description = makeStringDescribingMismatch(matcher, actual);
        id <HCTestFailureHandler> failureRouter = [HCTestFailureHandlerFactory routerForTestCaseType:testCase];
        [failureRouter signalFailureInTestCase:testCase fileName:fileName lineNumber:lineNumber description:description];
    }
}

