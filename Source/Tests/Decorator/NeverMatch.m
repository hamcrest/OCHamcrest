//
//  OCHamcrest - NeverMatch.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "NeverMatch.h"

#import "HCDescription.h"


@implementation NeverMatch

+ (id)neverMatch
{
    return [[self alloc] init];
}

+ (NSString *)mismatchDescription
{
    return @"NEVERMATCH";
}

- (BOOL)matches:(id)item
{
    return NO;
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [mismatchDescription appendText:[NeverMatch mismatchDescription]];
}

@end
