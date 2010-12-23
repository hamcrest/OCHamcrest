//
//  OCHamcrest - HCIsDictionaryContainingValue.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsDictionaryContainingValue.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContainingValue

+ (id) isDictionaryContainingValue:(id<HCMatcher>)theValueMatcher
{
    return [[[self alloc] initWithValueMatcher:theValueMatcher] autorelease];
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
        for (id oneValue in [dict allValues])
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


OBJC_EXPORT id<HCMatcher> HC_hasValue(id matcherOrValue)
{
    return [HCIsDictionaryContainingValue isDictionaryContainingValue:HCWrapInMatcher(matcherOrValue)];
}
