//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


NS_ASSUME_NONNULL_BEGIN

@interface NeverMatch : HCBaseMatcher

+ (id)neverMatch;
+ (NSString *)mismatchDescription;
- (BOOL)matches:(nullable id)item;
- (void)describeMismatchOf:(nullable id)item to:(nullable id <HCDescription>)mismatchDescription;

@end

NS_ASSUME_NONNULL_END
