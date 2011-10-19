//
//  OCHamcrest - HCConformsToProtocol.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Todd Farrell
//

#import "HCConformsToProtocol.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@implementation HCConformsToProtocol

+ (id)conformsToProtocol:(Protocol *)protocol
{
    return [[[self alloc] initWithProtocol:protocol] autorelease];
}

- (id)initWithProtocol:(Protocol *)aProtocol
{
    HCRequireNonNilObject(aProtocol);
    
    self = [super init];
    if (self)
        theProtocol = aProtocol;
    return self;
}

- (BOOL)matches:(id)item
{
    return [item conformsToProtocol:theProtocol];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"an object that conforms to "]
     appendText:NSStringFromProtocol(theProtocol)];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_conformsToProtocol(Protocol *aProtocol)
{
    return [HCConformsToProtocol conformsToProtocol:aProtocol];
}
