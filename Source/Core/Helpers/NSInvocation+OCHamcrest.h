// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2023 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSInvocation (OCHamcrest)

+ (NSInvocation *)och_invocationWithTarget:(id)target selector:(SEL)selector;
+ (NSInvocation *)och_invocationOnObjectOfType:(Class)aClass selector:(SEL)selector;
- (id)och_invoke;

@end

NS_ASSUME_NONNULL_END
