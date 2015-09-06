//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandlerChain.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"

static HCTestFailureHandler *chain = nil;


@implementation HCTestFailureHandlerChain

+ (HCTestFailureHandler *)chain
{
    if (!chain)
    {
        HCTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] initWithSuccessor:nil];
        HCTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] initWithSuccessor:genericHandler];
        HCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] initWithSuccessor:ocunitHandler];
        chain =  xctestHandler;
    }
    return chain;
}

@end
