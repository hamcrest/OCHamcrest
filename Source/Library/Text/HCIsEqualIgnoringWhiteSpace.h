//
//  OCHamcrest - HCIsEqualIgnoringWhiteSpace.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests if a string is equal to another string, ignoring any changes in whitespace.
*/
@interface HCIsEqualIgnoringWhiteSpace : HCBaseMatcher
{
    NSString* originalString;
    NSString* strippedString;
}

+ (HCIsEqualIgnoringWhiteSpace*) isEqualIgnoringWhiteSpace:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


/**
    Tests if a string is equal to another string, ignoring any changes in whitespace.
 */
OBJC_EXPORT id<HCMatcher> HC_equalToIgnoringWhiteSpace(NSString* aString);

/**
    Shorthand for HC_endsWith, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define equalToIgnoringWhiteSpace HC_equalToIgnoringWhiteSpace
#endif
