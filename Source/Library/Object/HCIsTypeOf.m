//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCIsTypeOf.h"


@implementation HCIsTypeOf

+ (instancetype)isTypeOf:(Class)expectedClass
{
    return [[self alloc] initWithClass:expectedClass];
}

- (BOOL)matches:(id)item
{
    return [item isMemberOfClass:self.theClass];
}

- (NSString *)expectation
{
    return @"an exact instance of ";
}

@end


id HC_isA(Class expectedClass)
{
    return [HCIsTypeOf isTypeOf:expectedClass];
}
