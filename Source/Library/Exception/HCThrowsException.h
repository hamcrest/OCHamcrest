//
//  OCHamcrest - HCThrowsException.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCThrowsException : HCBaseMatcher

@property (atomic) BOOL expected;

- (id)initWithExpected:(BOOL)expected;
+ (id)willThrowException:(BOOL)expected;

@end


FOUNDATION_EXPORT id HC_willThrowException(void);
FOUNDATION_EXPORT id HC_willNotThrowException(void);

/**
 Matches if the call/code block throws an exception.
 
 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_throwsException instead.)
 
 @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define willThrowException() HC_willThrowException()
#endif

/**
 Matches if the call/code block does not throw an exception.
 
 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_notThrowsException instead.)
 
 @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define willNotThrowException() HC_willNotThrowException()
#endif
