//
//  OCHamcrest - HCIsNil.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the value @c nil?
*/
@interface HCIsNil : HCBaseMatcher
{
}

+ (HCIsNil*) isNil;

@end


/**
    Matches if the value is @c nil.
 */
OBJC_EXPORT id<HCMatcher> HC_nilValue();

/**
    Shorthand for HC_nilValue, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define nilValue HC_nilValue
#endif


/**
    Matches if the value is not @c nil.
 */
OBJC_EXPORT id<HCMatcher> HC_notNilValue();

/**
    Shorthand for HC_notNilValue, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define notNilValue HC_notNilValue
#endif
