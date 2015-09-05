//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCClassMatcher : HCBaseMatcher

@property (readonly, nonatomic, strong) Class theClass;

- (instancetype)initWithClass:(Class)aClass;

@end
