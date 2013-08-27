#import <Foundation/Foundation.h>

@class HCTestFailure;


@protocol HCTestFailureHandler <NSObject>

@property (nonatomic, strong) id <HCTestFailureHandler> successor;

/**
    Signal test failure at specific location.
 */
- (void)signalFailure:(HCTestFailure *)failure;

@end
