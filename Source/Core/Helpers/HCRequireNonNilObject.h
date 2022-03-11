// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Throws an NSException if <em>obj</em> is <code>nil</code>.
*/
FOUNDATION_EXPORT void HCRequireNonNilObject(id obj);

NS_ASSUME_NONNULL_END
