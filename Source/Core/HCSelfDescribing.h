//  OCHamcrest by Jon Reid, https://qualitycoding.org/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

@import Foundation;

#import "HCDescription.h"   // Convenience header


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract The ability of an object to describe itself.
 */
@protocol HCSelfDescribing <NSObject>

/*!
 * @abstract Generates a description of the object.
 * @param description The description to be built or appended to.
 * @discussion The description may be part of a description of a larger object of which this is just
 * a component, so it should be worded appropriately.
 */
- (void)describeTo:(id <HCDescription>)description;

@end

NS_ASSUME_NONNULL_END
