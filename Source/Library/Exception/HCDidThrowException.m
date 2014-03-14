//
//  OCHamcrest - HCThrowsException.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import "HCDidThrowException.h"


@implementation HCDidThrowException

- (id)initWithException:(NSException *)exception
{
    self = [super init];
    if(self) {
        self.exception = exception;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ thrown", [self.exception name]];
}

@end
