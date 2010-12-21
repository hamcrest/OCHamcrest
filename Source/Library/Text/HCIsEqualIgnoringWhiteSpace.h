//
//  OCHamcrest - HCIsEqualIgnoringWhiteSpace.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests if a string is equal to another string, ignoring any changes in whitespace.
    @ingroup text
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
    @see HCIsEqualIgnoringWhiteSpace
    @ingroup text
 */
OBJC_EXPORT id<HCMatcher> HC_equalToIgnoringWhiteSpace(NSString* string);

/**
    Shorthand for @ref HC_endsWith, available if HC_SHORTHAND is defined.
    @ingroup text
 */
#ifdef HC_SHORTHAND
    #define equalToIgnoringWhiteSpace HC_equalToIgnoringWhiteSpace
#endif


/** @} */
