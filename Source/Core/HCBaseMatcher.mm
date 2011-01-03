//
//  OCHamcrest - HCBaseMatcher.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCBaseMatcher.h"

    // OCHamcrest
#import "HCStringDescription.h"


@interface HCBaseMatcher (Private)
- (void) subclassResponsibility:(SEL)command;
@end

@implementation HCBaseMatcher (Private)

- (void) subclassResponsibility:(SEL)command
{
	NSString* className = NSStringFromClass([self class]);
    [NSException raise:NSGenericException
                format:@"-[%@  %s] not implemented", className, command];
}

@end

#define ABSTRACT_METHOD [self subclassResponsibility:_cmd]


@implementation HCBaseMatcher

- (NSString*) description
{
    return [HCStringDescription stringFrom:self];
}


- (BOOL) matches:(id)item
{
    ABSTRACT_METHOD;
    return NO;
}


- (BOOL) matches:(id)item describingMismatchTo:(id<HCDescription>)mismatchDescription
{
    BOOL matchResult = [self matches:item];
    if (!matchResult)
        [self describeMismatchOf:item to:mismatchDescription];
    return matchResult;
}


- (void) describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [[mismatchDescription appendText:@"was "] appendDescriptionOf:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    ABSTRACT_METHOD;
}

@end
