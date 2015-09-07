//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <Foundation/Foundation.h>


@interface FakeWithCount : NSObject

@property (nonatomic, assign, readonly) NSUInteger count;

+ (instancetype)fakeWithCount:(NSUInteger)fakeCount;
- (instancetype)initWithCount:(NSUInteger)fakeCount;

@end
