//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


@interface Mismatchable : HCBaseMatcher

+ (instancetype)mismatchable:(NSString *)string;

@end
