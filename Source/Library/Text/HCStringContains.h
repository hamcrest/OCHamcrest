//
//  OCHamcrest - HCStringContains.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that contains a substring.
    @ingroup text
 */
@interface HCStringContains : HCSubstringMatcher
{
}

+ (HCStringContains*) stringContains:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that contains a substring.
    @see HCStringContains
    @ingroup text
 */
OBJC_EXPORT id<HCMatcher> HC_containsString(NSString* aSubstring);

/**
    Shorthand for @ref HC_containsString, available if HC_SHORTHAND is defined.
    @ingroup text
 */
#ifdef HC_SHORTHAND
    #define containsString HC_containsString
#endif
