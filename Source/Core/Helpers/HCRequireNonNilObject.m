// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

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
