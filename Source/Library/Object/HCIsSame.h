//
//  OCHamcrest - HCIsSame.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsSame : HCBaseMatcher
{
    id object;
}

+ (id)isSameAs:(id)anObject;
- (id)initSameAs:(id)anObject;

@end


OBJC_EXPORT id<HCMatcher> HC_sameInstance(id object);

/**
    sameInstance(object) -
    Matches if actual object is the same instance as the given object.

    @param object  Object to compare against; the "expected value."
    
    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_sameInstance instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define sameInstance HC_sameInstance
#endif
