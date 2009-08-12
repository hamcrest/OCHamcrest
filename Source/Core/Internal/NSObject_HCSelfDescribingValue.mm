//
//  OCHamcrest - NSObject_HCSelfDescribingValue.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "NSObject_HCSelfDescribingValue.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation NSObject (HCSelfDescribingValue)

- (void) describeTo:(id<HCDescription>)description
{
    [description appendValue:self];
}

@end
