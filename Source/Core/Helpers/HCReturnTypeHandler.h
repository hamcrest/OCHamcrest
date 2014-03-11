//
//  OCHamcrest - HCReturnTypeHandler.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <Foundation/Foundation.h>


/**
 Chain-of-responsibility for handling NSInvocation return types.
 */
@interface HCReturnTypeHandler : NSObject

@property (nonatomic, strong) HCReturnTypeHandler *successor;

- (instancetype)initWithType:(char const *)handlerType;
- (id)returnValueOfType:(char const *)type fromInvocation:(NSInvocation *)invocation;

@end
