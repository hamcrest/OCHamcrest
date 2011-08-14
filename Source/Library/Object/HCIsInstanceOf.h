//
//  OCHamcrest - HCIsInstanceOf.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCIsInstanceOf : HCBaseMatcher
{
    Class theClass;
}

+ (id)isInstanceOf:(Class)type;
- (id)initWithType:(Class)type;

@end


OBJC_EXPORT id<HCMatcher> HC_instanceOf(Class aClass);

/**
    Matches if object is an instance of, or inherits from, a given class.
    
    @param aClass  A class object representing the Objective-C class to be tested.
    
    The @c instanceOf matcher checks whether the object is an instance of a given class or an
    instance of any class that inherits from that class.
    
    In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_instanceOf instead.

    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define instanceOf(aClass) HC_instanceOf(aClass)
#endif
