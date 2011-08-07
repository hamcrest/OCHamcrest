//
//  OCHamcrest - HCIsInstanceOf.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCIsInstanceOf.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@implementation HCIsInstanceOf

+ (id)isInstanceOf:(Class)type
{
    return [[[self alloc] initWithType:type] autorelease];
}


- (id)initWithType:(Class)type
{
    HCRequireNonNilObject(type);

    self = [super init];
    if (self != nil)
        theClass = type;
    return self;
}


- (BOOL)matches:(id)item
{
    return [item isKindOfClass:theClass];
}


- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"an instance of "]
                  appendText:NSStringFromClass(theClass)];
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_instanceOf(Class type)
{
    return [HCIsInstanceOf isInstanceOf:type];
}
