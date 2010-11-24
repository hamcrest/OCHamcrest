//
//  OCHamcrest - HCStringContains.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that contains a substring.
 */
@interface HCStringContains : HCSubstringMatcher
{
}

+ (HCStringContains*) stringContains:(NSString*)aSubstring;

@end


/**
    Tests if the argument is a string that contains a substring.
 */
OBJC_EXPORT id<HCMatcher> HC_containsString(NSString* aSubstring);

/**
    Shorthand for HC_containsString, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define containsString HC_containsString
#endif
