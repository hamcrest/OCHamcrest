//
//  OCHamcrest - HCHasProperty.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Justin Shacklette
//

#import "HCHasProperty.h"

#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"
#import "NSInvocation+OCHamcrest.h"


@implementation HCHasProperty

+ (instancetype)hasProperty:(NSString *)property value:(id <HCMatcher>)aValueMatcher
{
    return [[self alloc] initWithProperty:property value:aValueMatcher];
}

- (instancetype)initWithProperty:(NSString *)property value:(id <HCMatcher>)aValueMatcher
{
    HCRequireNonNilObject(property);
    
    self = [super init];
    if (self != nil)
    {
        propertyName = [property copy];
        valueMatcher = aValueMatcher;
    }
    return self;
}

- (BOOL)matches:(id)item
{
    SEL propertyGetter = NSSelectorFromString(propertyName);
    if (![item respondsToSelector:propertyGetter])
        return NO;

    NSInvocation *getterInvocation = [NSInvocation och_invocationWithTarget:item selector:propertyGetter];
    id propertyValue = [getterInvocation och_invoke];
    return [valueMatcher matches:propertyValue];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"an object with "]
                    appendText:propertyName]
                    appendText:@" "]
                    appendDescriptionOf:valueMatcher];
}
@end


id HC_hasProperty(NSString *name, id valueMatch)
{
    return [HCHasProperty hasProperty:name value:HCWrapInMatcher(valueMatch)];
}
