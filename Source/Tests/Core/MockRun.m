//
//  MockRun.m
//  OCHamcrest
//
//  Created by Sergio Padrino on 8/25/13.
//  Copyright (c) 2013 hamcrest.org. All rights reserved.
//

#import "MockRun.h"

@implementation MockTestRun

- (void)addException:(NSException *) anException
{
    if ([[anException name] isEqualToString:SenTestFailureException])
        ++myFailureCount;
    else
        ++myUnexpectedExceptionCount;
}

- (unsigned int)failureCount
{
    return myFailureCount;
}

- (unsigned int)unexpectedExceptionCount
{
    return myUnexpectedExceptionCount;
}

- (void)stop
{
    // Override to avoid posting notification.
}

@end
