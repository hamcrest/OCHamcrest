//
//  OCHamcrest - HCThrowsException.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import "HCThrowsException.h"


@implementation HCThrowsException

+ (instancetype)throwsException
{
    return [[self alloc] init];
}

- (BOOL)matches:(id)item
{
    return item == nil;
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"throws exception"];
}

@end


id HC_throwsException()
{
    return [HCThrowsException throwsException];
}
