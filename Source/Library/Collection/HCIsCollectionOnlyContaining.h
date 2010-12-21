//
//  OCHamcrest - HCIsCollectionOnlyContaining.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Matches collections that only contain elements satisfying a given matcher.

    This matcher will never match an empty collection.

    @ingroup collection
*/
@interface HCIsCollectionOnlyContaining : HCBaseMatcher
{
    id<HCMatcher> matcher;
}

+ (HCIsCollectionOnlyContaining*) isCollectionOnlyContaining:(id<HCMatcher>)aMatcher;
- (id) initWithMatcher:(id<HCMatcher>)aMatcher;

@end


/**
    Matches collections that only contain elements satisfying any of a list of matchers.

    For example,
    <code>[NSArray arrayWithObjects:@"c", "a", @"b", nil]</code>
    would satisfy
    <code>onlyContains(lessThan(@"d"), nil)</code>.
    
    If a @a items is not a matcher, it is equivalent to equalTo(x), so the array in the example
    above would also satisfy
    <code>onlyContains(@"a", @"b", @"c", nil)</code>.
 
    @b Synonym: @ref onlyContains
    @param items  Comma-separated list of matchers - or values for @ref equalTo matching - ending with @c nil.
    @see HCIsCollectionOnlyContaining
    @ingroup collection
 */
OBJC_EXPORT id<HCMatcher> HC_onlyContains(id items, ...);

/**
    Synonym for @ref HC_onlyContains, available if @c HC_SHORTHAND is defined.
    @ingroup collection
 */
#ifdef HC_SHORTHAND
    #define onlyContains HC_onlyContains
#endif
