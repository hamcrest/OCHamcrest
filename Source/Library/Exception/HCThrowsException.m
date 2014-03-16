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
    return [self initWithExpected:expected name:nil];
}

- (id)initWithExpected:(BOOL)expected name:(NSString *)exceptionName
{
    self = [super init];
    if(self) {
        self.expected = expected;
        self.exceptionName = exceptionName;
    }
    return self;
}

- (BOOL)matches:(id)item
{
    if(self.expected) {
        BOOL match = [item isKindOfClass:[HCDidThrowException class]];
        if(nil != self.exceptionName) {
            HCDidThrowException *e = (HCDidThrowException*) item;
            match &= [[e.exception name] isEqualToString:self.exceptionName];
        }
        return match;
    }
    else {
        return ![item isKindOfClass:[HCDidThrowException class]];
    }
}

- (void)describeTo:(id<HCDescription>)description
{
    if(self.expected) {
        if(nil != self.exceptionName) {
            [description appendText:[NSString stringWithFormat:@"will throw %@", self.exceptionName]];
        }
        else {
            [description appendText:@"will throw exception"];
        }
    }
    else {
        [description appendText:@"will not throw exception"];
    }
}

@end


id HC_willThrowException()
{
    return [[HCThrowsException alloc] initWithExpected:YES];
}
id HC_willNotThrowException()
{
    return [[HCThrowsException alloc] initWithExpected:NO];
}
id HC_willThrow(NSString *exceptionName)
{
    return [[HCThrowsException alloc] initWithExpected:YES name:exceptionName];
}
