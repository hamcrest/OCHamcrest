#import "NSObject_HCSelfDescribingValue.h"

#import "HCDescription.h"


@implementation NSObject (HCSelfDescribingValue)

- (void) describeTo:(id<HCDescription>)description
{
    [description appendValue:self];
}

@end
