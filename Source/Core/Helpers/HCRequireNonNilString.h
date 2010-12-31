//
//  OCHamcrest - HCRequireNonNilString.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <Foundation/Foundation.h>
#import <objc/objc-api.h>


/**
    Throws an NSException if @a string is @c nil.
    @b Deprecated: Use @ref HCRequireNonNilObject instead.
    @ingroup helpers
*/
OBJC_EXPORT void HCRequireNonNilString(NSString* string);
