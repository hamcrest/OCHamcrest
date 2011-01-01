//
//  OCHamcrest - FakeCountingObject.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <Foundation/Foundation.h>


@interface FakeCountingObject : NSObject
{
    NSUInteger count;
}

@property (nonatomic, readonly) NSUInteger count;

+ (id) fakeWithCount:(NSUInteger)fakeCount;
- (id) initWithCount:(NSUInteger)fakeCount;

@end
