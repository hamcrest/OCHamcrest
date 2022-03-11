// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCTestFailure.h"


@implementation HCTestFailure

- (instancetype)initWithTestCase:(id)testCase
                        fileName:(NSString *)fileName
                      lineNumber:(NSUInteger)lineNumber
                          reason:(NSString *)reason
{
    self = [super init];
    if (self)
    {
        _testCase = testCase;
        _fileName = [fileName copy];
        _lineNumber = lineNumber;
        _reason = [reason copy];
    }
    return self;
}

@end
