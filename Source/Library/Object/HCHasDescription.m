// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2023 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCHasDescription.h"

#import "HCWrapInMatcher.h"
#import "NSInvocation+OCHamcrest.h"


@implementation HCHasDescription

- (instancetype)initWithDescription:(id <HCMatcher>)descriptionMatcher
{
    NSInvocation *anInvocation = [NSInvocation och_invocationOnObjectOfType:[NSObject class]
                                                                   selector:@selector(description)];
    self = [super initWithInvocation:anInvocation matching:descriptionMatcher];
    if (self)
        self.shortMismatchDescription = YES;
    return self;
}

@end


id HC_hasDescription(id descriptionMatcher)
{
    return [[HCHasDescription alloc] initWithDescription:HCWrapInMatcher(descriptionMatcher)];
}
