//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "HCRequireNonNilObject.h"


void HCRequireNonNilObject(id obj)
{
    if (obj == nil)
    {
        @throw [NSException exceptionWithName:@"NilObject"
                                       reason:@"Must be non-nil object"
                                     userInfo:nil];
    }
}
