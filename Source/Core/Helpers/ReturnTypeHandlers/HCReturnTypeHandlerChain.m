//
//  OCHamcrest - HCReturnTypeHandlerChain.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCReturnTypeHandlerChain.h"

#import "HCObjectReturnTypeHandler.h"
#import "HCCharReturnTypeHandler.h"
#import "HCBoolReturnTypeHandler.h"
#import "HCIntReturnTypeHandler.h"
#import "HCShortReturnTypeHandler.h"
#import "HCLongReturnTypeHandler.h"
#import "HCLongLongReturnTypeHandler.h"
#import "HCUnsignedCharReturnTypeHandler.h"
#import "HCUnsignedIntReturnTypeHandler.h"
#import "HCUnsignedShortReturnTypeHandler.h"
#import "HCUnsignedLongReturnTypeHandler.h"
#import "HCUnsignedLongLongReturnTypeHandler.h"
#import "HCFloatReturnTypeHandler.h"
#import "HCDoubleReturnTypeHandler.h"


HCReturnTypeHandler *HCReturnTypeHandlerChain(void)
{
    static HCReturnTypeHandler *chain = nil;
    if (!chain)
    {
        HCReturnTypeHandler *objectHandler = [[HCObjectReturnTypeHandler alloc] init];
        HCReturnTypeHandler *charHandler = [[HCCharReturnTypeHandler alloc] init];
        HCReturnTypeHandler *boolHandler = [[HCBoolReturnTypeHandler alloc] init];
        HCReturnTypeHandler *intHandler = [[HCIntReturnTypeHandler alloc] init];
        HCReturnTypeHandler *shortHandler = [[HCShortReturnTypeHandler alloc] init];
        HCReturnTypeHandler *longHandler = [[HCLongReturnTypeHandler alloc] init];
        HCReturnTypeHandler *longLongHandler = [[HCLongLongReturnTypeHandler alloc] init];
        HCReturnTypeHandler *unsignedCharHandler = [[HCUnsignedCharReturnTypeHandler alloc] init];
        HCReturnTypeHandler *unsignedIntHandler = [[HCUnsignedIntReturnTypeHandler alloc] init];
        HCReturnTypeHandler *unsignedShortHandler = [[HCUnsignedShortReturnTypeHandler alloc] init];
        HCReturnTypeHandler *unsignedLongHandler = [[HCUnsignedLongReturnTypeHandler alloc] init];
        HCReturnTypeHandler *unsignedLongLongHandler = [[HCUnsignedLongLongReturnTypeHandler alloc] init];
        HCReturnTypeHandler *floatHandler = [[HCFloatReturnTypeHandler alloc] init];
        HCReturnTypeHandler *doubleHandler = [[HCDoubleReturnTypeHandler alloc] init];

        chain = objectHandler;
        objectHandler.successor = charHandler;
        charHandler.successor = boolHandler;
        boolHandler.successor = intHandler;
        intHandler.successor = shortHandler;
        shortHandler.successor = longHandler;
        longHandler.successor = longLongHandler;
        longLongHandler.successor = unsignedCharHandler;
        unsignedCharHandler.successor = unsignedIntHandler;
        unsignedIntHandler.successor = unsignedShortHandler;
        unsignedShortHandler.successor = unsignedLongHandler;
        unsignedLongHandler.successor = unsignedLongLongHandler;
        unsignedLongLongHandler.successor = floatHandler;
        floatHandler.successor = doubleHandler;
    }
    return chain;
}
