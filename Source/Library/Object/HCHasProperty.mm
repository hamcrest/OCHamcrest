//
//  OCHamcrest - HCHasProperty.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCHasProperty.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"

@implementation HCHasProperty

+ (id) hasProperty:(NSString *)aProperty value:(id<HCMatcher>)aValueMatcher
{
    return [[[self alloc] initWithProperty:aProperty value:aValueMatcher] autorelease];
}

- (id) initWithProperty:(NSString *)aProperty value:(id<HCMatcher>)aValueMatcher
{
    HCRequireNonNilObject(aProperty);
    
    self = [super init];
    if (self != nil) {
        property = [aProperty copy];
        valueMatcher = [aValueMatcher retain];
    }
    return self;
}

- (void) dealloc
{
    [property release];
    [valueMatcher release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    SEL propertyGetter = NSSelectorFromString(property);
    
    if ([item respondsToSelector:propertyGetter]) {
        if ([valueMatcher matches:[item performSelector:propertyGetter]])
            return YES;
    }
    return NO;
}

- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:[NSString stringWithFormat:@"an object with a property named <%@> with a value of <", property]]
      appendDescriptionOf:valueMatcher]
     appendText:@">"];
}
@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_hasProperty(NSString *aProperty, id aValueMatcher)
{
    return [HCHasProperty hasProperty:aProperty value:HCWrapInMatcher(aValueMatcher)];
}
