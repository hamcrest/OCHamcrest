//
//  OCHamcrest - HCIsDictionaryContainingValue.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsDictionaryContainingValue.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContainingValue

+ (HCIsDictionaryContainingValue*) isDictionaryContainingValue:(id<HCMatcher>)theValueMatcher
{
    return [[[HCIsDictionaryContainingValue alloc] initWithValueMatcher:theValueMatcher] autorelease];
}


- (id) initWithValueMatcher:(id<HCMatcher>)theValueMatcher
{
    self = [super init];
    if (self != nil)
        valueMatcher = [theValueMatcher retain];
    return self;
}


- (void) dealloc
{
    [valueMatcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)dict
{
    if ([dict respondsToSelector:@selector(allValues)])
    {
#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2
        for (id oneValue in [dict allValues])
#else
        NSEnumerator* enumerator = [dict objectEnumerator];
        id oneValue;
        while ((oneValue = [enumerator nextObject]) != nil)
#endif
        {
            if ([valueMatcher matches:oneValue])
                return YES;
        }
    }
    return NO;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"dictionary with value "]
                    appendDescriptionOf:valueMatcher];
}

@end


extern "C" {

id<HCMatcher> HC_hasValue(id item)
{
    return [HCIsDictionaryContainingValue isDictionaryContainingValue:HC_wrapInMatcher(item)];
}

}   // extern "C"
