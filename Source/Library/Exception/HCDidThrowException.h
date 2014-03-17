//
//  OCHamcrest - HCDidThrowException.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//


/**
 * @brief This a private container that wraps an exception instance when an exception is thrown.
 * This is so we can distinguish between an exception returned and thrown.
 */
@interface HCDidThrowException : NSObject

@property (atomic, retain) NSException *exception;

- (id)initWithException:(NSException *)exception;
- (NSRange)rangeOfString:(NSString *)aString;

@end
