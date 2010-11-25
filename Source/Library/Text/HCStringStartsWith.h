//
//  OCHamcrest - HCStringStartsWith.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that starts with a substring.

    \ingroup text
 */
@interface HCStringStartsWith : HCSubstringMatcher
{
}

+ (HCStringStartsWith*) stringStartsWith:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that starts with a substring.

    \ingroup text
 */
OBJC_EXPORT id<HCMatcher> HC_startsWith(NSString* aSubstring);

/**
    Shorthand for \ref HC_startsWith, available if HC_SHORTHAND is defined.

    \ingroup text
 */
#ifdef HC_SHORTHAND
    #define startsWith HC_startsWith
#endif
