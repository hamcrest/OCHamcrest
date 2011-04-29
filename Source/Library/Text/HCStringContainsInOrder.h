//
//  OCHamcrest - HCStringContainsInOrder.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests if a string contains a given list of substrings, in order.

    @b Factory: @ref stringContainsInOrder
    @ingroup text_matchers
 */
@interface HCStringContainsInOrder : HCBaseMatcher
{
    NSArray *substrings;
}

+ (id)containsInOrder:(NSArray *)substringList;
- (id)initWithSubstrings:(NSArray *)substringList;

@end


#pragma mark -

/**
    Tests if a string contains a given list of substrings, in order.

    @b Synonym: @ref stringContainsInOrder
    @see HCStringContainsInOrder
    @ingroup text_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_stringContainsInOrder(NSString *substring, ...);

/**
    stringContainsInOrder(substring, ...) -
    Tests if a string contains a given list of substrings, in order.

    Synonym for @ref HC_stringContainsInOrder, available if @c HC_SHORTHAND is defined.
    @see HCStringContainsInOrder
    @ingroup text_matchers
 */
#ifdef HC_SHORTHAND
    #define stringContainsInOrder HC_stringContainsInOrder
#endif
