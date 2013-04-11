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

+ (id)isTypeOf:(Class)type
{
    return [[self alloc] initWithType:type];
}

- (id)initWithType:(Class)aClass
{
    HCRequireNonNilObject(aClass);

    self = [super init];
    if (self)
        theClass = aClass;
    return self;
}

- (BOOL)matches:(id)item
{
    return [item isMemberOfClass:theClass];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"an exact instance of "]
                  appendText:NSStringFromClass(theClass)];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [[[[mismatchDescription appendText:@"was "]
                            appendText:NSStringFromClass([item class])]
                            appendText:@" instance "]
                            appendDescriptionOf:item];
}

@end


#pragma mark -

id<HCMatcher> HC_isA(Class aClass)
{
    return [HCIsTypeOf isTypeOf:aClass];
}
