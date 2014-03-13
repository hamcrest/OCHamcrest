//
//  OCHamcrest - HCThrowsException.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import "HCThrowsException.h"
#import "HCDidThrowException.h"


@implementation HCThrowsException

- (id)initWithExpected:(BOOL)expected
{
    self = [super init];
    if(self) {
        self.expected = expected;
    }
    return self;
}

+ (instancetype)willThrowException:(BOOL)expected
{
    return [[self alloc] initWithExpected:expected];
}

- (BOOL)matches:(id)item
{
    if(self.expected) {
        return [item isKindOfClass:[HCDidThrowException class]];
    }
    else {
        return ![item isKindOfClass:[HCDidThrowException class]];
    }
}

- (void)describeTo:(id<HCDescription>)description
{
    if(self.expected) {
        [description appendText:@"will throw exception"];
    }
    else {
        [description appendText:@"will not throw exception"];
    }
}

@end


id HC_willThrowException()
{
    return [HCThrowsException willThrowException:YES];
}
id HC_willNotThrowException()
{
    return [HCThrowsException willThrowException:NO];
}
