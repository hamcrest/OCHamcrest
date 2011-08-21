//
//  OCHamcrest - NeverMatch.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "NeverMatch.h"

#import "HCDescription.h"


@implementation NeverMatch

+ (id)neverMatch
{
    return [[[self alloc] init] autorelease];
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
