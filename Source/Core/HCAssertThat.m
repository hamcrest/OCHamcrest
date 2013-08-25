//
//  OCHamcrest - HCAssertThat.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCAssertThat.h"

#import "HCAssertThatAfter.h"

#import "HCStringDescription.h"
#import "HCMatcher.h"

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                                           const char *fileName, int lineNumber)
{
    HC_assertThatAfterWithLocation(testCase, 0, HC_futureValueOf(actual), matcher, fileName, lineNumber);
}
