//
//  OCHamcrest - FakeWithCount.h
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <Foundation/Foundation.h>


@interface FakeWithCount : NSObject
{
    NSUInteger count;
}

@property (nonatomic, readonly) NSUInteger count;

+ (id)fakeWithCount:(NSUInteger)fakeCount;
- (id)initWithCount:(NSUInteger)fakeCount;

@end
