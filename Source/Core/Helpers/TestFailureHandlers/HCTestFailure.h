//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>


/**
 Test failure location and reason.

 @ingroup integration
 */
@interface HCTestFailure : NSObject

@property (nonatomic, strong, readonly) id testCase;
@property (nonatomic, copy, readonly) NSString *fileName;
@property (nonatomic, assign, readonly) NSUInteger lineNumber;
@property (nonatomic, strong, readonly) NSString *reason;

- (instancetype)initWithTestCase:(id)testCase
                        fileName:(NSString *)fileName
                      lineNumber:(NSUInteger)lineNumber
                          reason:(NSString *)reason;

@end
