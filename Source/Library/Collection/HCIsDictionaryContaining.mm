//
//  OCHamcrest - HCIsDictionaryContaining.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsDictionaryContaining.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContaining

+ (HCIsDictionaryContaining*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher
                                                  value:(id<HCMatcher>)theValueMatcher;
{
    return [[[HCIsDictionaryContaining alloc]
                    initWithKeyMatcher:theKeyMatcher valueMatcher:theValueMatcher] autorelease];
}


- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher valueMatcher:(id<HCMatcher>)theValueMatcher;
{
    self = [super init];
    if (self != nil)
    {
        keyMatcher = [theKeyMatcher retain];
        valueMatcher = [theValueMatcher retain];
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
#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2
        for (id oneKey in dict)
#else
        NSEnumerator* enumerator = [dict keyEnumerator];
        id oneKey;
        while ((oneKey = [enumerator nextObject]) != nil)
#endif
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


extern "C" {

id<HCMatcher> HC_hasEntry(id key, id value)
{
    return [HCIsDictionaryContaining isDictionaryContainingKey:HC_wrapInMatcher(key)
                                                         value:HC_wrapInMatcher(value)];
}

}   // extern "C"
