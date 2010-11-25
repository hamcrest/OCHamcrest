//
//  OCHamcrest - HCHasDescription.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCHasDescription.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCHasDescription

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)descriptionMatcher
{
    return [[[HCHasDescription alloc] initWithDescription:descriptionMatcher] autorelease];
}


- (id) initWithDescription:(id<HCMatcher>)descriptionMatcher;
{
    NSInvocation* anInvocation = [HCInvocationMatcher
                                        createInvocationForSelector:@selector(description)
                                        onClass:[NSObject class]];
    self = [super initWithInvocation:anInvocation matching:descriptionMatcher];
    return self;
}

@end


OBJC_EXPORT id<HCMatcher> HC_hasDescription(id expectedDescription)
{
    return [HCHasDescription hasDescription:HCWrapInMatcher(expectedDescription)];
}
