//
//  OCHamcrest - HCStringEndsWith.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that ends with a substring.
    @ingroup text_matchers
 */
@interface HCStringEndsWith : HCSubstringMatcher
{
}

+ (id) stringEndsWith:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that ends with a substring.
    
    @b Synonym: @ref endsWith
    @see HCStringEndsWith
    @ingroup text_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_endsWith(NSString* aSubstring);

/**
    Synonym for @ref HC_endsWith, available if @c HC_SHORTHAND is defined.
    @ingroup text_matchers
 */
#ifdef HC_SHORTHAND
    #define endsWith HC_endsWith
#endif
