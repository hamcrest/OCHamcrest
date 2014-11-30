//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <OCHamcrest/HCBaseMatcher.h>


@interface Mismatchable : HCBaseMatcher

+ (instancetype)mismatchable:(NSString *)string;

@end
