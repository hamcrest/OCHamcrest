//
//  OCHamcrest - HCIsNil.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the value @c nil?
    @ingroup core
*/
@interface HCIsNil : HCBaseMatcher
{
}

+ (id) isNil;

@end


/**
    Matches if the value is @c nil.
 
    @b Synonym: @ref nilValue
    @see HCIsNil
    @ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_nilValue();

/**
    Synonym for @ref HC_nilValue, available if @c HC_SHORTHAND is defined.
    @ingroup core
 */
#ifdef HC_SHORTHAND
    #define nilValue HC_nilValue
#endif


/**
    Matches if the value is not @c nil.
 
    @b Synonym: @ref notNilValue
    @see HCIsNil
    @see HCIsNot
    @ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_notNilValue();

/**
    Synonym for @ref HC_notNilValue, available if @c HC_SHORTHAND is defined.
    @ingroup core
 */
#ifdef HC_SHORTHAND
    #define notNilValue HC_notNilValue
#endif
