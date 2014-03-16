//
//  OCHamcrest - HCThrowsException.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCThrowsException : HCBaseMatcher

@property (atomic) BOOL expected;
@property (atomic) NSString *exceptionName;

- (id)initWithExpected:(BOOL)expected;
- (id)initWithExpected:(BOOL)expected name:(NSString *)exceptionName;

@end


FOUNDATION_EXPORT id HC_willThrowException(void);
FOUNDATION_EXPORT id HC_willNotThrowException(void);
FOUNDATION_EXPORT id HC_willThrow(NSString *exceptionName);

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

/**
 Matches if the call/code block throws a specific exception.
 
 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_throwsException instead.)
 
 @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define willThrow(exceptionName) HC_willThrow(exceptionName)
#endif
