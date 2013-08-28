#import <Foundation/Foundation.h>

@class HCTestFailure;


@protocol HCTestFailureHandler <NSObject>

@property (nonatomic, strong) id <HCTestFailureHandler> successor;

/**
    Handle test failure at specific location.
 */
- (void)handleFailure:(HCTestFailure *)failure;

@end
