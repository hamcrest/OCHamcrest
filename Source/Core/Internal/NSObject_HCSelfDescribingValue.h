//
//  OCHamcrest - NSObject_HCSelfDescribingValue.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Mac
#import <Foundation/Foundation.h>

@protocol HCDescription;


/**
    This category allows any object to satisfy the HCSelfDescribing protocol.
*/
@interface NSObject (HCSelfDescribingValue)

/**
    Generates a description of the object.

    @param description The description to be appended to.
*/
- (void) describeTo:(id<HCDescription>)description;

@end
