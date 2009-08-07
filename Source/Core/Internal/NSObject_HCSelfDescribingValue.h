#import <Foundation/Foundation.h>

@protocol HCDescription;


@interface NSObject (HCSelfDescribingValue)

- (void) describeTo:(id<HCDescription>)description;

@end
