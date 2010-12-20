//
//  OCHamcrest - HCIsDictionaryContainingValue.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches dictionaries containing a value satisfying a given matcher.
    @ingroup collection
 */
@interface HCIsDictionaryContainingValue : HCBaseMatcher
{
    id<HCMatcher> valueMatcher;
}

+ (HCIsDictionaryContainingValue*) isDictionaryContainingValue:(id<HCMatcher>)theValueMatcher;
- (id) initWithValueMatcher:(id<HCMatcher>)theValueMatcher;

@end


/**
    Matches dictionaries containing a value satisfying a given matcher.
    @param matcherOrValue  A matcher, or a value for @ref equalTo matching.
    @see HCIsDictionaryContainingValue
    @ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_hasValue(id matcherOrValue);

/**
    Shorthand for @ref HC_hasValue, available if @c HC_SHORTHAND is defined.
    @ingroup collection
 */
#ifdef HC_SHORTHAND
    #define hasValue HC_hasValue
#endif
