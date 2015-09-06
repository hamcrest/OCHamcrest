//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandlerChain.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"

static HCTestFailureHandler *chainHead = nil;


@implementation HCTestFailureHandlerChain

+ (HCTestFailureHandler *)chain
{
    if (!chainHead)
    {
        HCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] init];
        HCTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] init];
        HCTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] init];

        chainHead =  xctestHandler;
        xctestHandler.successor = ocunitHandler;
        ocunitHandler.successor = genericHandler;
    }
    return chainHead;
}

+ (void)addHandler:(HCTestFailureHandler *)handler
{
    handler.successor = [self chain];
    chainHead = handler;
}

+ (void)reset
{
    chainHead = nil;
}

@end
