//
//  OCHamcrest - HCIsInstanceOf.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests whether the value is an instance of a class (including subclasses).
 */
@interface HCIsInstanceOf : HCBaseMatcher
{
    Class theClass;
}

+ (HCIsInstanceOf*) isInstanceOf:(Class)type;
- (id) initWithType:(Class)type;

@end


/**
    Is the value an instance of a particular type?
 */
OBJC_EXPORT id<HCMatcher> HC_instanceOf(Class type);

/**
    Shorthand for \ref HC_instanceOf, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define instanceOf HC_instanceOf
#endif
