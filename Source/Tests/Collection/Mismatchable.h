// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCBaseMatcher.h>


@NS_ASSUME_NONNULL_BEGIN

interface Mismatchable : HCBaseMatcher

+ (instancetype)mismatchable:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
