//
//  OCHamcrest - HCIsEmptyCollection.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsEmptyCollection.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCIsEqualToNumber.h"


@implementation HCIsEmptyCollection

+ (id)isEmptyCollection
{
    return [[[self alloc] init] autorelease];
}


- (id)init
{
    self = [super initWithCount:HC_equalToUnsignedInteger(0)];
    return self;
}


- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [[mismatchDescription appendText:@"was "] appendDescriptionOf:item];
}


- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"empty collection"];
}

@end

//--------------------------------------------------------------------------------------------------

OBJC_EXPORT id<HCMatcher> HC_empty()
{
    return [HCIsEmptyCollection isEmptyCollection];
}
