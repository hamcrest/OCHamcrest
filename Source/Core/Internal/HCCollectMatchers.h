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

NSMutableArray* HC_collectMatchers(id<HCMatcher> matcher, va_list args);

#ifdef __cplusplus
}
#endif
