//
//  OCHamcrest - HCIsAnything.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsAnything.h"

#import "HCDescription.h"


@implementation HCIsAnything

+ (id)isAnything
{
    return [[[self alloc] init] autorelease];
}

+ (id)isAnythingWithDescription:(NSString *)aDescription
{
    return [[[self alloc] initWithDescription:aDescription] autorelease];
}

- (id)init
{
    [self initWithDescription:@"ANYTHING"];
    return self;
}

- (id)initWithDescription:(NSString *)aDescription
{
    self = [super init];
    if (self)
        description = [aDescription copy];
    return self;
}

- (void)dealloc
{
    [description release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    return YES;
}

- (void)describeTo:(id<HCDescription>)aDescription
{
    [aDescription appendText:description];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_anything()
{
    return [HCIsAnything isAnything];
}

OBJC_EXPORT id<HCMatcher> HC_anythingWithDescription(NSString *description)
{
    return [HCIsAnything isAnythingWithDescription:description];
}
