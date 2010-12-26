//
//  OCHamcrest - HCStringStartsWith.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that starts with a substring.
    @ingroup text_matchers
 */
@interface HCStringStartsWith : HCSubstringMatcher
{
}

+ (id) stringStartsWith:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that starts with a substring.
    
    @b Synonym: @ref startsWith
    @see HCStringStartsWith
    @ingroup text_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_startsWith(NSString* aSubstring);

/**
    Synonym for @ref HC_startsWith, available if @c HC_SHORTHAND is defined.
    @ingroup text_matchers
 */
#ifdef HC_SHORTHAND
    #define startsWith HC_startsWith
#endif
