//
//  OCHamcrest - HCIsEqual.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the object equal to another object, as tested by the -isEqual: method?
    @ingroup core
 */
@interface HCIsEqual : HCBaseMatcher
{
    id object;
}

+ (HCIsEqual*) isEqualTo:(id)anObject;
- (id) initEqualTo:(id)anObject;

@end


/**
    Is the object equal to another object, as tested by the -isEqual: method?
 
    @b Synonym: @ref equalTo
    @see HCIsEqual
    @ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_equalTo(id object);

/**
    Synonym for @ref HC_equalTo, available if @c HC_SHORTHAND is defined.
    @ingroup core
 */
#ifdef HC_SHORTHAND
    #define equalTo HC_equalTo
#endif
