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
