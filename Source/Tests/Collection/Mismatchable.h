//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


@NS_ASSUME_NONNULL_BEGIN

interface Mismatchable : HCBaseMatcher

+ (instancetype)mismatchable:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
