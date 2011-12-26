//
//  OCHamcrest - HCHasProperty.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Justin Shacklette
//

#import "HCHasProperty.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCHasProperty

+ (id)hasProperty:(NSString *)property value:(id<HCMatcher>)aValueMatcher
{
    return [[[self alloc] initWithProperty:property value:aValueMatcher] autorelease];
}

- (id)initWithProperty:(NSString *)property value:(id<HCMatcher>)aValueMatcher
{
    HCRequireNonNilObject(property);
    
    self = [super init];
    if (self != nil)
    {
        propertyName = [property copy];
        valueMatcher = [aValueMatcher retain];
    }
    return self;
}

- (void)dealloc
{
    [propertyName release];
    [valueMatcher release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    SEL propertyGetter = NSSelectorFromString(propertyName);
    if (![item respondsToSelector:propertyGetter])
        return NO;

    NSMethodSignature *getterSignature = [item methodSignatureForSelector:propertyGetter];
    NSInvocation *getterInvocation = [NSInvocation invocationWithMethodSignature:getterSignature];
    [getterInvocation setTarget:item];
    [getterInvocation setSelector:propertyGetter];
    [getterInvocation invoke];
    
    const char *argType = [getterSignature methodReturnType];
    switch (argType[0])
    {
        case 'c':
            char charValue;
            [getterInvocation getReturnValue:&charValue];
            return [valueMatcher matches:[NSNumber numberWithChar:charValue]];
            break;
        case 'i':
            int intValue;
            [getterInvocation getReturnValue:&intValue];
            return [valueMatcher matches:[NSNumber numberWithInt:intValue]];
            break;
        case 's':
            short shortValue;
            [getterInvocation getReturnValue:&shortValue];
            return [valueMatcher matches:[NSNumber numberWithShort:shortValue]];
            break;
        case 'l':
            long longValue;
            [getterInvocation getReturnValue:&longValue];
            return [valueMatcher matches:[NSNumber numberWithLong:longValue]];
            break;
        case 'q':
            long long longLongValue;
            [getterInvocation getReturnValue:&longLongValue];
            return [valueMatcher matches:[NSNumber numberWithLong:longLongValue]];
            break;
        case 'C':
            unsigned char unsignedCharValue;
            [getterInvocation getReturnValue:&unsignedCharValue];
            return [valueMatcher matches:[NSNumber numberWithUnsignedChar:unsignedCharValue]];
            break;
        case 'I':
            unsigned int unsignedIntValue;
            [getterInvocation getReturnValue:&unsignedIntValue];
            return [valueMatcher matches:[NSNumber numberWithUnsignedInt:unsignedIntValue]];
            break;
        case 'S':
            unsigned short unsignedShortValue;
            [getterInvocation getReturnValue:&unsignedShortValue];
            return [valueMatcher matches:[NSNumber numberWithUnsignedShort:unsignedShortValue]];
            break;
        case 'L':
            unsigned long unsignedLongValue;
            [getterInvocation getReturnValue:&unsignedLongValue];
            return [valueMatcher matches:[NSNumber numberWithUnsignedLong:unsignedLongValue]];
            break;
        case 'Q':
            unsigned long long unsignedLongLongValue;
            [getterInvocation getReturnValue:&unsignedLongLongValue];
            return [valueMatcher matches:[NSNumber numberWithUnsignedLongLong:unsignedLongLongValue]];
            break;
        case 'f':
            float floatValue;
            [getterInvocation getReturnValue:&floatValue];
            return [valueMatcher matches:[NSNumber numberWithFloat:floatValue]];
            break;
        case 'd':
            double doubleValue;
            [getterInvocation getReturnValue:&doubleValue];
            return [valueMatcher matches:[NSNumber numberWithDouble:doubleValue]];
            break;
    }

    return [valueMatcher matches:[item performSelector:propertyGetter]];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"an object with "]
                    appendText:propertyName]
                    appendText:@" "]
                    appendDescriptionOf:valueMatcher];
}
@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_hasProperty(NSString *name, id valueMatch)
{
    return [HCHasProperty hasProperty:name value:HCWrapInMatcher(valueMatch)];
}
