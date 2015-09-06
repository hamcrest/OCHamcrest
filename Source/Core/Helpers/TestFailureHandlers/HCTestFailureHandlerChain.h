//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>

@class HCTestFailureHandler;


/**
 Returns chain of test failure handlers.

 @ingroup integration
 */


@interface HCTestFailureHandlerChain : NSObject

+ (HCTestFailureHandler *)chain;

@end
