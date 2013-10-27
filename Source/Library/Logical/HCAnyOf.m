//
//  OCHamcrest - HCAnyOf.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCAnyOf.h"

#import "HCCollectMatchers.h"
#import "HCDescription.h"


@implementation HCAnyOf

+ (instancetype)anyOf:(NSArray *)theMatchers
{
    return [[self alloc] initWithMatchers:theMatchers];
}

- (instancetype)initWithMatchers:(NSArray *)theMatchers
{
    self = [super init];
    if (self)
        matchers = theMatchers;
    return self;
}

- (BOOL)matches:(id)item
{
    for (id <HCMatcher> oneMatcher in matchers)
        if ([oneMatcher matches:item])
            return YES;
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendList:matchers start:@"(" separator:@" or " end:@")"];
}

@end


id HC_anyOf(id match, ...)
{
    va_list args;
    va_start(args, match);
    NSArray *matcherList = HCCollectMatchers(match, args);
    va_end(args);
    
    return [HCAnyOf anyOf:matcherList];
}
