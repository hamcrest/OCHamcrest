//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureReporterChain.h"

#import "HCGenericTestFailureReporter.h"
#import "HCSenTestFailureReporter.h"
#import "HCXCTestFailureReporter.h"

static HCTestFailureReporter *chainHead = nil;


@implementation HCTestFailureReporterChain

+ (HCTestFailureReporter *)chain
{
    if (!chainHead)
    {
        HCTestFailureReporter *xctestHandler = [[HCXCTestFailureReporter alloc] init];
        HCTestFailureReporter *ocunitHandler = [[HCSenTestFailureReporter alloc] init];
        HCTestFailureReporter *genericHandler = [[HCGenericTestFailureReporter alloc] init];

        chainHead =  xctestHandler;
        xctestHandler.successor = ocunitHandler;
        ocunitHandler.successor = genericHandler;
    }
    return chainHead;
}

+ (void)addHandler:(HCTestFailureReporter *)handler
{
    handler.successor = [self chain];
    chainHead = handler;
}

+ (void)reset
{
    chainHead = nil;
}

@end
