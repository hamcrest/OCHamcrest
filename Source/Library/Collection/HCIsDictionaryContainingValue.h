//
//  OCHamcrest - HCIsDictionaryContainingValue.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches dictionaries containing a value satisfying a matcher.

    \ingroup collection
 */
@interface HCIsDictionaryContainingValue : HCBaseMatcher
{
    id<HCMatcher> valueMatcher;
}

+ (HCIsDictionaryContainingValue*) isDictionaryContainingValue:(id<HCMatcher>)theValueMatcher;
- (id) initWithValueMatcher:(id<HCMatcher>)theValueMatcher;

@end


/**
    Matches dictionaries containing a value satisfying a matcher.

    \a item is a matcher, or an implied HCIsEqual matcher will wrap the item.

    \ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasValue(id item);

/**
    Shorthand for \ref HC_hasValue, available if HC_SHORTHAND is defined.

    \ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasValue HC_hasValue
#endif
