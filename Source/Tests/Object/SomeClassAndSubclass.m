//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
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
