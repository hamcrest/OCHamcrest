//
//  OCHamcrest - HCHasDescription.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCHasDescription.h"

#import "HCWrapInMatcher.h"


@implementation HCHasDescription

+ (instancetype)hasDescription:(id <HCMatcher>)descriptionMatcher
{
    return [[self alloc] initWithDescription:descriptionMatcher];
}

- (instancetype)initWithDescription:(id <HCMatcher>)descriptionMatcher
{
    NSInvocation *anInvocation = [HCInvocationMatcher invocationForSelector:@selector(description)
                                                                    onClass:[NSObject class]];
    self = [super initWithInvocation:anInvocation matching:descriptionMatcher];
    self.shortMismatchDescription = YES;
    return self;
}

@end


id HC_hasDescription(id match)
{
    return [HCHasDescription hasDescription:HCWrapInMatcher(match)];
}
