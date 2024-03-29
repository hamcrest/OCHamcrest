// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2008 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <Foundation/Foundation.h>
#import <OCHamcrest/HCMatcher.h>

#define HC_ABSTRACT_METHOD [self subclassResponsibility:_cmd]


NS_ASSUME_NONNULL_BEGIN

/*!
 * @abstract Base class for all HCMatcher implementations.
 * @discussion Simple matchers can just subclass HCBaseMatcher and implement <code>-matches:</code>
 * and <code>-describeTo:</code>. But if the matching algorithm has several "no match" paths,
 * consider subclassing HCDiagnosingMatcher instead.
 */
@interface HCBaseMatcher : NSObject <HCMatcher, NSCopying>

/*! @abstract Raises exception that command (a pseudo-abstract method) is not implemented. */
- (void)subclassResponsibility:(SEL)command;

@end

NS_ASSUME_NONNULL_END
