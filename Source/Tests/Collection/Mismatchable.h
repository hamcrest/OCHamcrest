//
//  OCHamcrest - Mismatchable.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface Mismatchable : HCBaseMatcher

+ (instancetype)mismatchable:(NSString *)string;

@end
