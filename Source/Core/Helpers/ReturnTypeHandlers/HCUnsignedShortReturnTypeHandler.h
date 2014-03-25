//
//  OCHamcrest - HCUnsignedShortReturnTypeHandler.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCReturnTypeHandler.h"


@interface HCUnsignedShortReturnTypeHandler : HCReturnTypeHandler

- (instancetype)initWithSuccessor:(HCReturnTypeHandler *)successor;

@end
