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

    \ingroup text
 */
@interface HCStringEndsWith : HCSubstringMatcher
{
}

+ (HCStringEndsWith*) stringEndsWith:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that ends with a substring.

    \ingroup text
 */
OBJC_EXPORT id<HCMatcher> HC_endsWith(NSString* aSubstring);

/**
    Shorthand for \ref HC_endsWith, available if HC_SHORTHAND is defined.

    \ingroup text
 */
#ifdef HC_SHORTHAND
    #define endsWith HC_endsWith
#endif
