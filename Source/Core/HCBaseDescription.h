// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>
#import <OCHamcrest/HCDescription.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Base class for all HCDescription implementations.
 */
@interface HCBaseDescription : NSObject <HCDescription>
@end


/*!
 * @abstract Methods that must be provided by subclasses of HCBaseDescription.
 */
@interface HCBaseDescription (SubclassResponsibility)

/*!
 * @abstract Appends the specified string to the description.
 */
- (void)append:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
