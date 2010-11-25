//
//  OCHamcrest - HCRequireNonNilString.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <Foundation/Foundation.h>
#import <objc/objc-api.h>


/**
    Throws an NSException if @a aString is nil.
*/
OBJC_EXPORT void HCRequireNonNilString(NSString* aString);
