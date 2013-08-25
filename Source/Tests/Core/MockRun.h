//
//  MockRun.h
//  OCHamcrest
//
//  Created by Sergio Padrino on 8/25/13.
//  Copyright (c) 2013 hamcrest.org. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface MockTestRun : SenTestCaseRun
{
    // Can't use original attributes because they're declared @private.
    unsigned int myFailureCount;
    unsigned int myUnexpectedExceptionCount;
}
@end
