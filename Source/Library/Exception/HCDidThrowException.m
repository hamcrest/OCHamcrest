//
//  OCHamcrest - HCThrowsException.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import "HCDidThrowException.h"


@implementation HCDidThrowException

- (id)initWithException:(id)exception
{
    self = [super init];
    if(self) {
        self.exception = exception;
    }
    return self;
}

@end
