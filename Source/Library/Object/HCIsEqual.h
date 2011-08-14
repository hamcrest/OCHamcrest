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
    
    @param anObject  The object to compare against as the expected value.
    
    The @c equalTo matcher compares the evaluated object to a given object for equality, as
    determined by the @c -isEqual: method.
    
    If @c anObject is @c nil, the matcher will successfully match @c nil.

    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalTo instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define equalTo(anObject) HC_equalTo(anObject)
#endif
