//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <Foundation/Foundation.h>


@interface FakeWithCount : NSObject

@property (readonly, nonatomic, assign) NSUInteger count;

+ (instancetype)fakeWithCount:(NSUInteger)fakeCount;
- (instancetype)initWithCount:(NSUInteger)fakeCount;

@end
