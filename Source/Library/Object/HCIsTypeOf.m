//
//  OCHamcrest - HCIsTypeOf.m
//  Copyright 2013 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCIsTypeOf.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@implementation HCIsTypeOf

+ (instancetype)isTypeOf:(Class)type
{
    return [[self alloc] initWithType:type];
}

- (BOOL)matches:(id)item
{
    return [item isMemberOfClass:theClass];
}

- (NSString *)expectation
{
    return @"an exact instance of ";
}

@end


id HC_isA(Class aClass)
{
    return [HCIsTypeOf isTypeOf:aClass];
}
