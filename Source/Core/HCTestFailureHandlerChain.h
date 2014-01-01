//
//  OCHamcrest - HCTestFailureHandlerChain.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <Foundation/Foundation.h>
#import <objc/objc-api.h>

@protocol HCTestFailureHandler;


/**
 Returns chain of test failure handlers.
 
 @ingroup integration
 */
OBJC_EXPORT id <HCTestFailureHandler> HC_testFailureHandlerChain(void);
