//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCClassMatcher : HCBaseMatcher

@property (readonly, nonatomic, strong) Class theClass;

- (instancetype)initWithType:(Class)type;

@end
