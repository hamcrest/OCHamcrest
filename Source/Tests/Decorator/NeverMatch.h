//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


@interface NeverMatch : HCBaseMatcher

+ (id)neverMatch;
+ (NSString *)mismatchDescription;
- (BOOL)matches:(id)item;
- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription;

@end
