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

@interface HCRunloopObserver : NSObject
@end

@implementation HCRunloopObserver
{
    CFRunLoopObserverRef observer;
}

- (instancetype)initWithPump:(HCRunloopObserverBlock)pump
{
    self = [super init];
    if (self)
    {
        observer = CFRunLoopObserverCreateWithHandler(NULL, kCFRunLoopBeforeWaiting, YES, 0, pump);
        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    }
    return self;
}

- (void)dealloc
{
    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    CFRelease(observer);
}

- (void)runUntilStoppedOrTimeout:(CFTimeInterval)timeout
{
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, timeout, false);
}

@end

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
    id actual = actualBlock();
    __block BOOL match = [matcher matches:actual];

    if (!match)
    {
        HCRunloopObserver *runloopObserver = [[HCRunloopObserver alloc] initWithPump:^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            assert(!match);
            id actualValue = actualBlock();
            match = [matcher matches:actualValue];
            if (match)
                CFRunLoopStop(CFRunLoopGetCurrent());
            else
                CFRunLoopWakeUp(CFRunLoopGetCurrent());
        }];
        [runloopObserver runUntilStoppedOrTimeout:timeout];
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
