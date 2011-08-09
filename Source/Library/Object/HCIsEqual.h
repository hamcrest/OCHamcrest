//
//  OCHamcrest - HCIsEqual.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsEqual : HCBaseMatcher
{
    id object;
}

+ (id)isEqualTo:(id)anObject;
- (id)initEqualTo:(id)anObject;

@end


OBJC_EXPORT id<HCMatcher> HC_equalTo(id object);

/**
    Matches if object is equal to the given object.
    
    @param object  Object to compare against; the "expected value."
    
    The @c equalTo macro compares an object (the actual value) to the given object (the expected
    value) for equality, as determined by the @c -isEqual: method.
    
    If the given object is @c nil, the matcher will match @c nil.

    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalTo instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define equalTo(object) HC_equalTo(object)
#endif
