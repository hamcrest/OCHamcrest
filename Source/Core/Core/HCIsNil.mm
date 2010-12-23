//
//  OCHamcrest - HCIsNil.mm
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCIsNil.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCIsNot.h"


@implementation HCIsNil

+ (id) isNil
{
    return [[[self alloc] init] autorelease];
}


- (BOOL) matches:(id)item
{
    return item == nil;
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendText:@"nil"];
}

@end


OBJC_EXPORT id<HCMatcher> HC_nilValue()
{
    return [HCIsNil isNil];
}


OBJC_EXPORT id<HCMatcher> HC_notNilValue()
{
    return HC_isNot([HCIsNil isNil]);
}
