//
//  OCHamcrest - HCIsDictionaryContainingValue.mm
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsDictionaryContainingValue.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@implementation HCIsDictionaryContainingValue

+ (id)isDictionaryContainingValue:(id<HCMatcher>)theValueMatcher
{
    return [[[self alloc] initWithValueMatcher:theValueMatcher] autorelease];
}

- (id)initWithValueMatcher:(id<HCMatcher>)theValueMatcher
{
    self = [super init];
    if (self)
        valueMatcher = [theValueMatcher retain];
    return self;
}

- (void)dealloc
{
    [valueMatcher release];
    [super dealloc];
}

- (BOOL)matches:(id)dict
{
    if ([dict respondsToSelector:@selector(allValues)])
        for (id oneValue in [dict allValues])
            if ([valueMatcher matches:oneValue])
                return YES;
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"a dictionary containing value "]
                  appendDescriptionOf:valueMatcher];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_hasValue(id valueMatch)
{
    HCRequireNonNilObject(valueMatch);
    return [HCIsDictionaryContainingValue isDictionaryContainingValue:HCWrapInMatcher(valueMatch)];
}
