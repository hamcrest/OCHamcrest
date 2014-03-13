//
//  OCHamcrest - HCDidThrowException.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//


/**
 * @brief This a private container that wraps an exception instance when an exception is thrown.
 * This is so we can distinguish between an exception returned and thrown.
 */
@interface HCDidThrowException : NSObject

@property (atomic) id exception;

- (id)initWithException:(id)exception;

@end
