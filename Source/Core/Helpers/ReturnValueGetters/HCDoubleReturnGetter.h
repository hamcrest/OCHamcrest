//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import "HCReturnValueGetter.h"


@interface HCDoubleReturnGetter : HCReturnValueGetter

- (instancetype)initWithSuccessor:(HCReturnValueGetter *)successor NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithType:(char const *)handlerType successor:(HCReturnValueGetter *)successor NS_UNAVAILABLE;

@end
