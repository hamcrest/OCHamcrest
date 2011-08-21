//
//  OCHamcrest - HCHasDescription.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCHasDescription.h"

#import "HCDescription.h"
#import "HCWrapInMatcher.h"


@implementation HCHasDescription

+ (id)hasDescription:(id<HCMatcher>)descriptionMatcher
{
    return [[[self alloc] initWithDescription:descriptionMatcher] autorelease];
}

- (id)initWithDescription:(id<HCMatcher>)descriptionMatcher
{
    NSInvocation *anInvocation = [HCInvocationMatcher invocationForSelector:@selector(description)
                                                                    onClass:[NSObject class]];
    self = [super initWithInvocation:anInvocation matching:descriptionMatcher];
    shortMismatchDescription = YES;
    return self;
}

@end


OBJC_EXPORT id<HCMatcher> HC_hasDescription(id match)
{
    return [HCHasDescription hasDescription:HCWrapInMatcher(match)];
}
