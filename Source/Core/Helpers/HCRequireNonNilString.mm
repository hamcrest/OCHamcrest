//
//  OCHamcrest - HCRequireNonNilString.m
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCRequireNonNilString.h"


OBJC_EXPORT void HCRequireNonNilString(NSString* aString)
{
    if (aString == nil)
    {
        @throw [NSException exceptionWithName: @"NotAString"
                                       reason: @"Must be non-nil string"
                                     userInfo: nil];
    }
}
