//
//  OCHamcrest - HCIsDictionaryContainingKey.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsDictionaryContainingKey.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContainingKey

+ (id)isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher
{
    return [[[self alloc] initWithKeyMatcher:theKeyMatcher] autorelease];
}


- (id)initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher
{
    self = [super init];
    if (self != nil)
        keyMatcher = [theKeyMatcher retain];
    return self;
}


- (void)dealloc
{
    [keyMatcher release];
    [super dealloc];
}


- (BOOL)matches:(id)dict
{
    if ([dict isKindOfClass:[NSDictionary class]])
    {
        for (id oneKey in dict)
        {
            if ([keyMatcher matches:oneKey])
                return YES;
        }
    }
    return NO;
}


- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a dictionary containing key "]
                  appendDescriptionOf:keyMatcher];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_hasKey(id matcherOrValue)
{
    HCRequireNonNilObject(matcherOrValue);
    return [HCIsDictionaryContainingKey isDictionaryContainingKey:HCWrapInMatcher(matcherOrValue)];
}
