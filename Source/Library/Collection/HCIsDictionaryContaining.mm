//
//  OCHamcrest - HCIsDictionaryContaining.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsDictionaryContaining.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContaining

+ (id) isDictionaryContainingKey:(id<HCMatcher>)aKeyMatcher
                           value:(id<HCMatcher>)aValueMatcher;
{
    return [[[self alloc]
                    initWithKeyMatcher:aKeyMatcher valueMatcher:aValueMatcher] autorelease];
}


- (id) initWithKeyMatcher:(id<HCMatcher>)aKeyMatcher
             valueMatcher:(id<HCMatcher>)aValueMatcher;
{
    self = [super init];
    if (self != nil)
    {
        keyMatcher = [aKeyMatcher retain];
        valueMatcher = [aValueMatcher retain];
    }
    return self;
}


- (void) dealloc
{
    [valueMatcher release];
    [keyMatcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)dict
{
    if ([dict isKindOfClass:[NSDictionary class]])
    {
        for (id oneKey in dict)
        {
            if ([keyMatcher matches:oneKey] && [valueMatcher matches:[dict objectForKey:oneKey]])
                return YES;
        }
    }
    return NO;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[[[description appendText:@"dictionary containing ["]
                     appendDescriptionOf:keyMatcher]
                     appendText:@"->"]
                     appendDescriptionOf:valueMatcher]
                     appendText:@"]"];
}

@end


OBJC_EXPORT id<HCMatcher> HC_hasEntry(id keyMatcher, id valueMatcher)
{
    HCRequireNonNilObject(keyMatcher);
    HCRequireNonNilObject(valueMatcher);
    return [HCIsDictionaryContaining isDictionaryContainingKey:HCWrapInMatcher(keyMatcher)
                                                         value:HCWrapInMatcher(valueMatcher)];
}
