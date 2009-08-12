//
//  OCHamcrest - NSObject_HCSelfDescribingValue.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Mac
#import <Foundation/Foundation.h>

@protocol HCDescription;


@interface NSObject (HCSelfDescribingValue)

- (void) describeTo:(id<HCDescription>)description;

@end
