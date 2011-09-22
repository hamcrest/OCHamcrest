//
//  OCHamcrest - HCHasProperty.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCHasProperty : HCBaseMatcher
{
    NSString *property;
    id<HCMatcher> valueMatcher;
}

+ (id) hasProperty:(NSString *)aProperty value:(id<HCMatcher>)aValueMatcher;
- (id) initWithProperty:(NSString *)aProperty value:(id<HCMatcher>)aValueMatcher;

@end


OBJC_EXPORT id<HCMatcher> HC_hasProperty(NSString *aProperty, id aValueMatcher);

/**
    hasProperty(aProperty, aValueMatcher) -
    Matches if object has a property of the given name with the given value.
 
    @param aProperty  The property name on the object.
    @param aValueMatcher  The object to compare against as the expected value.
 
    This matcher first checks if @c -get<property> exist.  If so, it invokes the property
    getter and compares the returned value with @a aValueMatcher.
 
    If @c -get<property> is @c nil, the matcher will successfully match @c nil.
 
    Example:
    @li @ref hasProperty(@"firstName", @"Joe")
 
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_hasProperty instead.)
 
    @ingroup object_matchers
 */
#ifdef HC_SHORTHAND
    #define hasProperty HC_hasProperty
#endif
