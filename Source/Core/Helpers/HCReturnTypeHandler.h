//
//  OCHamcrest - HCReturnTypeHandler.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <Foundation/Foundation.h>


@interface HCReturnTypeHandler : NSObject

@property (nonatomic, strong) HCReturnTypeHandler *successor;

- (instancetype)initWithType:(char const *)handlerType;
- (id)valueForReturnType:(char const *)type fromInvocation:(NSInvocation *)invocation;

@end
