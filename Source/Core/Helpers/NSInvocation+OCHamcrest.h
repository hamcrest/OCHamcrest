//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSInvocation (OCHamcrest)

+ (NSInvocation *)och_invocationWithTarget:(id)target selector:(SEL)selector;
+ (NSInvocation *)och_invocationOnObjectOfType:(Class)aClass selector:(SEL)selector;
- (id)och_invoke;

@end

NS_ASSUME_NONNULL_END
