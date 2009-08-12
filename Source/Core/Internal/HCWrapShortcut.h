//
//  OCHamcrest - HCWrapShortcut.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

@protocol HCMatcher;


#ifdef __cplusplus
extern "C" {
#endif

id<HCMatcher> HC_wrapShortcut(id item);

#ifdef __cplusplus
}
#endif
