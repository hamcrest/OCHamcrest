//  OCHamcrest by Jon Reid, https://qualitycoding.org/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import "SomeClassAndSubclass.h"


@implementation SomeClass

- (NSString *)description
{
    return @"SOME_CLASS";
}

@end


@implementation SomeSubclass

- (NSString *)description
{
    return @"SOME_SUBCLASS";
}

@end
