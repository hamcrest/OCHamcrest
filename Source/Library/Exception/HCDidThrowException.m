//
//  OCHamcrest - HCThrowsException.m
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Elliot Chance
//

#import "HCDidThrowException.h"


@implementation HCDidThrowException

- (id)initWithException:(NSException *)exception
{
    self = [super init];
    if(self) {
        self.exception = exception;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@", [self.exception name], [self.exception reason]];
}

/**
 * @brief This must be implemented for string matchers.
 * OCHamcrest tests if the object will repond to this selector before allowing string comparisons on it.
 */
- (NSRange)rangeOfString:(NSString *)aString
{
    return [[self description] rangeOfString:aString];
}

/**
 * @brief For equality matchers.
 */
- (BOOL)isEqual:(id)anObject
{
    return [[self description] isEqual:anObject];
}

@end
