//
//  OCHamcrest - HCHasDescription.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
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


extern "C" {

id<HCMatcher> HC_hasDescription(id item)
{
    return [HCHasDescription hasDescription:HC_wrapInMatcher(item)];
}

}   // extern "C"
