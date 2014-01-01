//
//  OCHamcrest - HCTestFailureHandlerChain.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCTestFailureHandlerChain.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"


id <HCTestFailureHandler> HC_testFailureHandlerChain(void)
{
    static id <HCTestFailureHandler> chain = nil;
    if (!chain)
    {
        HCXCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] init];
        HCSenTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] init];
        HCGenericTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] init];

        xctestHandler.successor = ocunitHandler;
        ocunitHandler.successor = genericHandler;

        chain =  xctestHandler;
    }
    return chain;
}
