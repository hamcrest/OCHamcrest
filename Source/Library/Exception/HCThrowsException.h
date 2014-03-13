//
//  OCHamcrest - HCThrowsException.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCThrowsException : HCBaseMatcher

+ (id)throwsException;

@end


FOUNDATION_EXPORT id HC_throwsException(void);

/**
 Matches if the call/code block throws an exception.
 
 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_nilValue instead.)
 
 @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define throwsException() HC_throwsException()
#endif
