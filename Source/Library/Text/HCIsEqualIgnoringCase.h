//
//  OCHamcrest - HCIsEqualIgnoringCase.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests if a string is equal to another string, regardless of the case.
    @ingroup text
 */
@interface HCIsEqualIgnoringCase : HCBaseMatcher
{
    NSString* string;
}

+ (HCIsEqualIgnoringCase*) isEqualIgnoringCase:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


/**
    Tests if a string is equal to another string, regardless of the case.

    @b Synonym: @ref equalToIgnoringCase
    @see HCIsEqualIgnoringCase
    @ingroup text
 */
OBJC_EXPORT id<HCMatcher> HC_equalToIgnoringCase(NSString* string);

/**
    Synonym for @ref HC_equalToIgnoringCase, available if @c HC_SHORTHAND is defined.
    @ingroup text
 */
#ifdef HC_SHORTHAND
    #define equalToIgnoringCase HC_equalToIgnoringCase
#endif
