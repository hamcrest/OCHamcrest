//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import "HCAssertThat.h"

#import "HCStringDescription.h"
#import "HCMatcher.h"
#import "HCTestFailure.h"
#import "HCTestFailureReporter.h"
#import "HCTestFailureReporterChain.h"
#import <libkern/OSAtomic.h>

typedef void (^HCRunloopObserverBlock)(CFRunLoopObserverRef, CFRunLoopActivity);

static void reportMismatch(id testCase, id actual, id <HCMatcher> matcher,
                           char const *fileName, int lineNumber)
{
    HCTestFailure *failure = [[HCTestFailure alloc] initWithTestCase:testCase
                                                            fileName:[NSString stringWithUTF8String:fileName]
                                                          lineNumber:(NSUInteger)lineNumber
                                                              reason:HCDescribeMismatch(matcher, actual)];
    HCTestFailureReporter *chain = [HCTestFailureReporterChain reporterChain];
    [chain handleFailure:failure];
}

void HC_assertThatWithLocation(id testCase, id actual, id <HCMatcher> matcher,
                               const char *fileName, int lineNumber)
{
    if (![matcher matches:actual])
        reportMismatch(testCase, actual, matcher, fileName, lineNumber);
}

void HC_assertWithTimeoutAndLocation(id testCase, NSTimeInterval timeout,
        HCFutureValue actualBlock, id <HCMatcher> matcher,
        const char *fileName, int lineNumber)
{
    // run immediately
    id actual = actualBlock();
    __block BOOL match = [matcher matches:actual];
    
    // if not already matched, pump the runloop until matched
    if (!match)
    {
        HCRunloopObserverBlock pump = ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            assert(!match); // runloop should have exited if match occurred
            id actual = actualBlock();
            match = [matcher matches:actual];
            if (match)
                CFRunLoopStop(CFRunLoopGetCurrent());
            else
                CFRunLoopWakeUp(CFRunLoopGetCurrent());
        };
        
        // set up runloop observer and wait stop call or timeout
        CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(NULL, kCFRunLoopBeforeWaiting, YES, 0, pump);
        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, timeout, false);
        
        // remove observer
        CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
        CFRelease(observer);
    }

    if (!match)
        reportMismatch(testCase, actual, matcher, fileName, lineNumber);
}

NSString *HCDescribeMismatch(id <HCMatcher> matcher, id actual)
{
    HCStringDescription *description = [HCStringDescription stringDescription];
    [[[description appendText:@"Expected "]
            appendDescriptionOf:matcher]
            appendText:@", but "];
    [matcher describeMismatchOf:actual to:description];
    return description.description;
}
