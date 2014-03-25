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
        HCReturnTypeHandler *doubleHandler = [[HCDoubleReturnTypeHandler alloc] initWithSuccessor:nil];
        HCReturnTypeHandler *floatHandler = [[HCFloatReturnTypeHandler alloc] initWithSuccessor:doubleHandler];
        HCReturnTypeHandler *unsignedLongLongHandler = [[HCUnsignedLongLongReturnTypeHandler alloc] initWithSuccessor:floatHandler];
        HCReturnTypeHandler *unsignedLongHandler = [[HCUnsignedLongReturnTypeHandler alloc] initWithSuccessor:unsignedLongLongHandler];
        HCReturnTypeHandler *unsignedShortHandler = [[HCUnsignedShortReturnTypeHandler alloc] initWithSuccessor:unsignedLongHandler];
        HCReturnTypeHandler *unsignedIntHandler = [[HCUnsignedIntReturnTypeHandler alloc] initWithSuccessor:unsignedShortHandler];
        HCReturnTypeHandler *unsignedCharHandler = [[HCUnsignedCharReturnTypeHandler alloc] initWithSuccessor:unsignedIntHandler];
        HCReturnTypeHandler *longLongHandler = [[HCLongLongReturnTypeHandler alloc] initWithSuccessor:unsignedCharHandler];
        HCReturnTypeHandler *longHandler = [[HCLongReturnTypeHandler alloc] initWithSuccessor:longLongHandler];
        HCReturnTypeHandler *shortHandler = [[HCShortReturnTypeHandler alloc] initWithSuccessor:longHandler];
        HCReturnTypeHandler *intHandler = [[HCIntReturnTypeHandler alloc] initWithSuccessor:shortHandler];
        HCReturnTypeHandler *boolHandler = [[HCBoolReturnTypeHandler alloc] initWithSuccessor:intHandler];
        HCReturnTypeHandler *charHandler = [[HCCharReturnTypeHandler alloc] initWithSuccessor:boolHandler];
        HCReturnTypeHandler *objectHandler = [[HCObjectReturnTypeHandler alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}
