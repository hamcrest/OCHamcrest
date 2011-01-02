//
//  OCHamcrest - NSObject+HCSelfDescribingValue.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "NSObject+HCSelfDescribingValue.h"

    // OCHamcrest
#import "HCDescription.h"


@implementation NSObject (HCSelfDescribingValue)

- (void) describeTo:(id<HCDescription>)description
{
    [description appendValue:self];
}

@end


// iOS: A linker bug prevents -ObjC from loading files from static libraries if the file contains
// only categories and no classes. The category method above is not loaded, so we crash if it's
// invoked.
// This can be solved by specifying the -all_load linker flag, but this is a heavy-handed approach.
// Instead, we define a dummy class to avoid the linker problem.
// See http://developer.apple.com/library/mac/#qa/qa2006/qa1490.html

@interface NSObject_HCSelfDescribingValue : NSObject
@end

@implementation NSObject_HCSelfDescribingValue
@end
