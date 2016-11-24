//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>


/*!
 * @abstract Chain-of-responsibility for handling NSInvocation return types.
 */
@interface HCReturnValueGetter : NSObject

- (instancetype)initWithType:(char const *)handlerType successor:(HCReturnValueGetter *)successor NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (id)returnValueOfType:(char const *)type fromInvocation:(NSInvocation *)invocation;

@end
