//
//  OCHamcrest - HCIsDictionaryContainingKey.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsDictionaryContainingKey.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContainingKey

+ (HCIsDictionaryContainingKey*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher
{
    return [[[HCIsDictionaryContainingKey alloc] initWithKeyMatcher:theKeyMatcher] autorelease];
}


- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher
{
    self = [super init];
    if (self != nil)
        keyMatcher = [theKeyMatcher retain];
    return self;
}


- (void) dealloc
{
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
            if ([keyMatcher matches:oneKey])
                return YES;
        }
    }
    return NO;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"dictionary with key "]
                    appendDescriptionOf:keyMatcher];
}

@end


extern "C" {

id<HCMatcher> HC_hasKey(id item)
{
    return [HCIsDictionaryContainingKey isDictionaryContainingKey:HC_wrapInMatcher(item)];
}

}   // extern "C"
