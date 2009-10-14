//
//  OCHamcrest - HCCollectMatchers.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Mac
#import <Foundation/Foundation.h>

    // C
#import <stdarg.h>

@protocol HCMatcher;


#ifdef __cplusplus
extern "C" {
#endif

/**
    Returns an array of matchers from a variable-length comma-separated list terminated by @c nil.
*/
NSMutableArray* HC_collectMatchers(id<HCMatcher> matcher, va_list args);

#ifdef __cplusplus
}
#endif
