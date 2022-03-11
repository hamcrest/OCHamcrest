// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

@interface FakeWithCount : NSObject

@property (nonatomic, assign, readonly) NSUInteger count;

+ (instancetype)fakeWithCount:(NSUInteger)fakeCount;
- (instancetype)initWithCount:(NSUInteger)fakeCount;

@end

NS_ASSUME_NONNULL_END
