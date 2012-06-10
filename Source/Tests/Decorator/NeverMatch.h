//
//  OCHamcrest - NeverMatch.h
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface NeverMatch : HCBaseMatcher

+ (id)neverMatch;
+ (NSString *)mismatchDescription;
- (BOOL)matches:(id)item;
- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription;

@end
